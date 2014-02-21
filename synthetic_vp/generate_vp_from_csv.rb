#!/usr/bin/env ruby

require 'erb'
require 'yaml'

def write_problem(criteria, value_units, contractors)
  max_units_for_contractor = value_units.length / 2
  bitwidth = 12

  template_string = <<-EOS
open util/integer

abstract sig Contractor {
  contractor_value_units : set ValueUnit,
  methods : set ContractorMethod
}
{
  contractor_value_units = methods.value_units
}

abstract sig ContractorMethod {
  value_units : set ValueUnit,
  contractor : one Contractor
}

abstract sig ValueUnit {
  <% criteria.each do |criterion| %>
  criterion_<%= criterion %>_value : one Int,
  <% end %>

  contractor_method : one ContractorMethod
}

<% value_units.each do |value_unit| %>
one sig ValueUnit_<%= value_unit %> extends ValueUnit {
}
<% end %>
<% contractors.each do |contractor, methods| %>

one sig Contractor_<%= contractor %> extends Contractor {
}
<% methods.each do |method, values| %>

one sig Contractor_<%= contractor %>_Method_<%= method %> extends ContractorMethod {
}
{
  contractor = Contractor_<%= contractor %>
}

<% end %>
<% end %>

one sig Problem {
  <% criteria.each do |criterion| %>
  <% last = (criteria[-1] == (criterion)) %>
  criterion_<%= criterion %>_total : one Int <% unless last %>,<% end %>
  <% end %>
}
{
  <% criteria.each do |criterion| %>
  criterion_<%= criterion %>_total = (sum vu : ValueUnit | vu.criterion_<%= criterion %>_value)
  <% end %>
}

fact { all vu : ValueUnit | one cm : ContractorMethod | vu in cm.value_units }
fact { value_units = ~(contractor_method) }
fact { methods = ~(contractor) }
fact { all c : Contractor | (# c.contractor_value_units) <= <%= max_units_for_contractor %> }

<% contractors.each do |contractor, methods| %>
<% methods.each do |method, values| %>
<% value_units.each do |value_unit| %>
fact { (ValueUnit_<%= value_unit %> in Contractor_<%= contractor %>_Method_<%= method %>.value_units) => (
<% criteria.each do |criterion| %>
<% last = (criteria[-1] == criterion) %>
        (ValueUnit_<%= value_unit %>.criterion_<%= criterion %>_value = <%= values[criterion][value_unit] %>) <% unless last %> && <% end %>
<% end %>
      )}
<% end %>
<% end %>
<% end %>
inst config {
  <%= bitwidth %> Int
}

objectives o_global {
  <% criteria.each do |criterion| %>
  <% last = (criteria[-1] == (criterion)) %>
  maximize Problem.criterion_<%= criterion %>_total<% unless last %>,<% end %>
  <% end %>
}

pred show {
}

run show for config optimize o_global
  EOS

  template = ERB.new( template_string, 0, "<>" )

  File.open("problem.als", "w") do |f|
    f.puts template.result(binding)
  end

end

files = ARGV
contractor_method_names = files.collect{|f| File.basename(f, '.csv')}
contractor_methods = {}
criteria = nil
value_units = nil

files.each do |filename|
  contractor_method_name = File.basename(filename, '.csv')
  contractor_methods[contractor_method_name] = {}
  File.open(filename) do |f|
    header = f.gets.chomp.split(",")
    local_value_units = []

    if criteria.nil?
      criteria = header[1..-1]
    end

    criteria.each {|a| contractor_methods[contractor_method_name][a] = {}}

    line = f.gets
    while !line.nil?
      line.chomp!
      line = line.split(",")
      value_unit = line[0]
      local_value_units << value_unit

      line = line[1..-1]
      line.each_index do |i|
        contractor_methods[contractor_method_name][criteria[i]][value_unit] = line[i].to_i
      end
      
      line = f.gets
    end

    value_units ||= local_value_units 
  end
end

contractors = {}

contractor_methods.each do |key, value|
  match = /Contractor_(.+)_Method_(.+)/.match(key)
  contractor_name = match[1]
  method_name = match[2]

  contractors[contractor_name] ||= {}
  contractors[contractor_name][method_name] = value
end

puts contractors.to_yaml
puts criteria.inspect
puts value_units.inspect

write_problem(criteria, value_units, contractors)
