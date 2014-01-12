#!/usr/bin/env ruby

require 'erb'

# Generates a YAML file with values for knapsack, rooks, and queens problems

# Largest metric value
MAX_VALUE = 9

# Maximum weight (for knapsack problems)
MAX_WEIGHT = 100

if ARGV.size != 2
  puts "Usage: #{$PROGRAM_NAME} num_items num_metrics"
  exit
end

num_items, num_metrics = ARGV[0..1].collect(&:to_i)

template_string = <<-eos
# These values are for the knapsack, rooks, and queens problem
# max_weight and weights are only for knapsack
max_weight: <%= MAX_WEIGHT %>
weights:
<% weights = [] %>
<% num_items.times do %>
<%   weights << rand(MAX_VALUE + 1) %>
<% end #do %>
  <%= weights %>
values:
<% num_items.times do %>
<%   metrics = [] %>
<%   num_metrics.times do %>
<%     metrics << rand(MAX_VALUE + 1) %>
<%   end #do %>
  - <%= metrics %>
<% end #do -%>
eos

template = ERB.new( template_string, 0, "<>" )

File.open("values.yaml", "w") do |f|
  f.puts template.result(binding)
end

puts "Created data file with #{num_items} values, each with #{num_metrics} metrics."
