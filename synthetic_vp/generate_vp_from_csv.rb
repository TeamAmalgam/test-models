#!/usr/bin/env ruby

require 'erb'

def write_problem(criteria, value_units, contractors)

  template_string <<-EOS
  open util/integer

  abstract sig Contractor {
    contractor_value_units : set ValueUnit,
    methods : set ContractorMethod
  }
  {
    contractor_value_units = methods.value_units
  }

  abstract sig ContractorMethod {
    <% criteria.each do |criterion| %>
    
    criterion_<%= criterion %>_values : ValueUnit -> Int,

    <% end %>

    value_units : set ValueUnit,
    contractor : one Contractor
  }

  abstract sig ValueUnit {
    <% criteria.each do |criterion| %>
    
    criterion_<%= criterion %>_value : Int,

    <% end %>

    contractor_method : one ContractorMethod
  }
  {
    <% criteria.each do |criterion| %>

    criterion_<%= criterion %>_value = contractor_method.criterion_<%= criterion %>_values[this]

    <% end %>
  }

  <% value_units.each do |value_unit| %>

  one sig ValueUnit_<%= value_unit %> extends ValueUnit {
  }

  <% end %>

  <% contractors.each do |contractor| %>

  one sig Contractor_<%= contractor[:name] %> extends Contractor {
  }

  <% contractor[:methods].each do |method| %>

  one sig Contractor_<%= contractor %>_Method_<%= method[:name] %> extends ContractorMethod {
  }
  {
    contractor = Contractor_<%= contractor %>

    <% criteria.each do |criterion| %>

    criterion_<%= criterion %>_values =
      <% value_units.each do |value_unit| %>
      <% last = (value_units[-1].equals(value_unit)) %>
      ValueUnit_<%= value_unit %> -> <%= method[:values][criteria][value_unit] %> <% unless last %> + <% end %>
      <% end %>

    <% end %>
  }

  <% end %>
  <% end %>

  one sig Problem {
    <% criteria.each do |criterion| %>
    <% last = (criteria[-1].equals(criterion)) %>
    criterion_<%= criterion %>_total : Int <% unless last %>,<% end %>
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

  inst config {
    <% bitwidth %> Int
  }

  objectives o_global {
    <% criteria.each do |criterion| %>
    <% last = (criteria[-1].equals(criterion)) %>
    maximize Problem.criterion_<%= criterion %>_total %> <% unless last %>,<% end %>
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
contractors = {}
contractor_method_names.each do |name|
  match = /Contractor_(.+)_Method_(.+)/.match(name)
  contractor_name = match.groups[1]
  method_name = match.groups[2]
  contractors[contractor_name] ||= {:name => contractor_name, :methods => []}
  contractors[contractor_name][:methods] << { :name => method_name, :values => {}}

end
write_problem(criteria, value_units, contractors)
