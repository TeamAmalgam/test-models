#!/usr/bin/env ruby

require 'erb'
require 'yaml'

def write_problem(criteria, value_units, contractors)
  max_units_for_contractor = value_units.length / 2
  bitwidth = 12

  template_string = <<-EOS
abstract Contractor
    methods -> ContractorMethod*
        [this.contractor = Contractor]
    assignedVUs -> ValueUnit*
        [this.assignedContractor = Contractor]

abstract ContractorMethod
    methodVUs -> MethodVU*
    contractor -> Contractor
    [this in contractor.methods]

    [all disj m1; m2 : methodVUs | m1.valueUnit.ref != m2.valueUnit.ref]

abstract MethodVU
    valueUnit -> ValueUnit
<% criteria.each do |criterion| %>
    criterion_<%= criterion %> ->> integer
<% end %>

abstract ValueUnit
    appliedContractorMethod -> ContractorMethod

    appliedMethodVU -> MethodVU
    [appliedMethodVU in appliedContractorMethod.methodVUs.ref]
    [appliedMethodVU.valueUnit = this]

    assignedContractor -> Contractor
    [assignedContractor = appliedContractorMethod.contractor.ref]

    [this in assignedContractor.assignedVUs]

<% criteria.each do |criterion| %>
    criterion_<%= criterion %> ->> integer = appliedMethodVU.criterion_<%= criterion %>
<% end %>

abstract Problem
<% criteria.each do |criterion| %>
    total_criterion_<%= criterion %> : integer = sum ValueUnit.criterion_<%= criterion %>
<% end %>

MyProblem: Problem
<% criteria.each do |criterion| %>
<<max MyProblem.total_criterion_<%= criterion %> >>
<% end %>

<% value_units.each do |value_unit| %>
ValueUnit_<%= value_unit %> : ValueUnit

<% end %>

<% contractors.each do |contractor, methods| %>
Contractor_<%= contractor %> : Contractor
<% methods.each do |method, values| %>
    ContractorMethod_<%= method %> : ContractorMethod
<% value_units.each do |value_unit| %>
        method_<%= value_unit %> : MethodVU
            [valueUnit = ValueUnit_<%= value_unit %>]
<% criteria.each do |criterion| %>
            [criterion_<%= criterion %> = <%= values[criterion][value_unit] %>]
<% end %>
<% end %>
        [methodVUs = <%= value_units.collect{|a| "method_" + a.to_s}.join(", ") %>]
<% end %>
    [methods = <%= methods.keys.collect{|a| "ContractorMethod_" + a.to_s}.join(", ") %>]
<% end %>
  EOS

  template = ERB.new( template_string, 0, "<>" )

  File.open("problem.cfr", "w") do |f|
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

puts ".cfr file written. Note: it may need to be adjusted (eg bitwidth, minimization vs maximization, additional constraints, etc)"

write_problem(criteria, value_units, contractors)
