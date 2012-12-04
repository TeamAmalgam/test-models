#!/usr/bin/env ruby

require 'erb'

n, m = ARGV[0..1].collect{|a| a.to_i} # n is number of items, m is number of profit functions

description = { "problem" => {
                  "max_weight" => 100,
                  "metrics" => [],
                  "items" => []}}
m.times do
  description["problem"]["metrics"] << "maximize"
end

n.times do
  item = { "weight" => rand(11),
           "metrics" => []}
  m.times do
    item["metrics"] << rand(11) 
  end
  description["problem"]["items"] << item
end

# Read in the problem description from the given file
metrics = description["problem"]["metrics"]
metricIds = (0..(metrics.count - 1)).to_a.collect{|a| "metric#{a}"}

items = description["problem"]["items"]

# Calculate bit width required
metricSums = metrics.collect{ 0 }
weightSum = 0
items.each do |item|
  item["metrics"].each_with_index do |metric_value, index|
    metricSums[index] += metric_value
  end
  weightSum += item["weight"]
end
maxWeight = description["problem"]["max_weight"]

maxInteger = (metricSums + [maxWeight] + [weightSum]).max
bit_width = (Math.log(maxInteger, 2)).ceil + 1

template = ERB.new <<-HERE
  open util/integer
  pred show {}
  
  abstract sig Item {
    weight : one Int,
    <% metricIds.each do |metric| %>
      <%= metric %> : one Int <%= "," unless metricIds[-1] == metric %>
    <% end %>
  }

  abstract sig Knapsack {
    items : set Item,
    max_weight : one Int,
    current_weight : one Int,
    <% metricIds.each do |metric| %>
      <%= metric %> : one Int <%= "," unless metricIds[-1] == metric %>
    <% end %>
  }

  // Metric of the knapsack is sum of item metrics
  <% metricIds.each do |metric| %>
    fact { all k : Knapsack | k.<%= metric %> = (sum i : k.items | i.<%= metric%>)}
  <% end %>

  // Weight of knapsack is sum of item weights
  fact { all k : Knapsack | k.current_weight = (sum i : k.items | i.weight)}
  
  // Weight of knapsack must be less than the max weight
  fact { all k : Knapsack | k.current_weight <= k.max_weight }

  // Define concrete items
  <% items.each_with_index do |item, index| %>
    one sig Item<%= index %> extends Item {} {
      weight = <%= item["weight"] %>
      <% metricIds.each_with_index do |metric, index2| %>
        <%= metric %> = <%= item["metrics"][index2] %> 
      <% end %>
    }
  <% end %>

  // Define concrete knapsack
  one sig ConcreteKnapsack extends Knapsack {} {
    max_weight = <%= description["problem"]["max_weight"] %>
  }

  inst KnapsackProblem {
    <%= bit_width %> Int
  }

  objectives o_global {
    <% metricIds.each_with_index do |id, index| %>
      <%= metrics[index] %> ConcreteKnapsack.<%= id %> <%= "," unless metricIds[-1] == id %>
    <% end %>
  }

  run show for KnapsackProblem optimize o_global
HERE

File.open("knapsack_#{n}_metrics_#{m}.als", 'w') do |f|
  f.puts template.result(binding)
end
