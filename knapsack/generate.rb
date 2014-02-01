#!/usr/bin/env ruby

require 'yaml'
require 'erb'

# Assumes values are saved in ../values.yaml
# Almost no error checking is done

def write_one_problem(data, num_items, num_metrics)
  max_weight = data["max_weight"]
  weights = data["weights"]
  values = data["values"]

  items = []
  num_items.times do |index|
    items <<  {
                "weight" => weights[index],
                "metrics" => values[index][0...num_metrics]
              }
  end

  metric_ids = (0...num_metrics).to_a.map{|index| "metric#{index}" }

  # Calculate the bit width required
  metric_sums = Array.new(num_metrics, 0)
  weight_sum = 0
  items.each do |item|
    item["metrics"].each_with_index do |metric_value, index|
      metric_sums[index] += metric_value
    end
    weight_sum += item["weight"]
  end

  max_integer = (metric_sums + [max_weight, weight_sum]).max
  bit_width = (Math.log(max_integer, 2)).ceil + 1

  template_string = <<-eos
open util/integer
pred show {}

abstract sig Item {
  weight : one Int,
<% metric_ids.each do |metric| %>
  <%= metric %> : one Int<%= "," unless metric_ids[-1] == metric %>
<% end %>
}

one sig Knapsack {
  items : set Item,
  max_weight : one Int,
  current_weight : one Int,
<% metric_ids.each do |metric| %>
  <%= metric %> : one Int<%= "," unless metric_ids[-1] == metric %>
<% end %>
}
{
  max_weight = <%= max_weight %>

  // Metric of the knapsack is sum of item metrics
<% metric_ids.each do |metric| %>
  <%= metric %> = (sum i : items | i.<%= metric %>)
<% end %>

  // Weight of knapsack is sum of item weights
  current_weight = (sum i : items | i.weight)

  // Weight of knapsack must be less than the max weight
  current_weight <= max_weight
}

// Define concrete items
<% items.each_with_index do |item, index| %>
one sig Item<%= index %> extends Item {} {
  weight = <%= item["weight"] %>
<% metric_ids.each_with_index do |metric, index2| %>
  <%= metric %> = <%= item["metrics"][index2] %>
<% end %>
}
<% end %>

inst KnapsackProblem {
  <%= bit_width %> Int
}

objectives o_global {
<% metric_ids.each_with_index do |id, index| %>
  maximize Knapsack.<%= id %><%= "," unless metric_ids[-1] == id %>
<% end %>
}

run show for KnapsackProblem optimize o_global
eos

  template = ERB.new( template_string, 0, "<>" )

  File.open("knapsack_#{num_items}_metrics_#{num_metrics}.als", "w") do |f|
    f.puts template.result(binding)
  end

  puts "Created Alloy file for knapsack_#{num_items}_metrics_#{num_metrics}"
end



if ARGV.size != 2 && ARGV.size != 3
  puts "Usage: #{$PROGRAM_NAME} num_items num_metrics"
  puts "Usage: #{$PROGRAM_NAME} num_items min_metrics max_metrics"
  exit
end

num_items = num_metrics = nil
num_items = min_metrics = max_metrics = nil

# Load the YAML file with all the values we need
data = YAML::load_file "../values.yaml"

if ARGV.size == 2
  num_items, num_metrics = ARGV[0..1].collect(&:to_i)
  write_one_problem(data, num_items, num_metrics)
elsif ARGV.size == 3
  num_items, min_metrics, max_metrics = ARGV[0..2].collect(&:to_i)
  (min_metrics..max_metrics).each do |num_metrics|
    write_one_problem(data, num_items, num_metrics)
  end
end
