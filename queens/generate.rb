#!/usr/bin/env ruby

require 'yaml'
require 'erb'

# Assumes values are saved in ../values.yaml
# Almost no error checking is done

def write_one_problem(data, num_pieces, num_metrics)
  values = data["values"]
  num_positions = num_pieces * num_pieces

  positions = []
  num_positions.times do |index|
    positions <<  {
                "metrics" => values[index][0...num_metrics]
              }
  end

  metric_ids = (0...num_metrics).to_a.map{|index| "metric#{index}" }

  # Generate diagonals, so we can get the indices for the chess board
  diag_indices = Array.new(num_pieces) { Array.new(num_pieces, nil) }
  diag1_start, diag2_start = 0, num_pieces - 1
  (0...num_pieces).to_a.each do |row|
    diag1 = diag1_start
    diag2 = diag2_start
    (0...num_pieces).to_a.each do |col|
      diag_indices[row][col] = {one: diag1, two: diag2}
      diag1 += 1
      diag2 -= 1
    end
    diag1_start += 1
    diag2_start += 1
  end
  diag_indices.flatten!

  # Generate a spiral, so we can get the indices for the chess board
  # http://stackoverflow.com/questions/4109836/help-with-spiral-matrix

  # New 2D array of nils
  spiral_indices = Array.new(num_pieces) { Array.new(num_pieces, nil) }
  # Start just outside the matrix
  row, col = 0, -1
  # Initial direction: stay in the same row but increase the column
  delta_r, delta_c = 0, 1
  (num_positions - 1).downto(0).each do |val|
    # Update the position and write in the value
    col += delta_c
    row += delta_r
    spiral_indices[row][col] = val

    # If the next position is past the edge or is an already-filled space,
    # change the direction
    if col + delta_c >= num_pieces || row + delta_r >= num_pieces ||
       col + delta_c < 0 || row + delta_r < 0 ||
       spiral_indices[row + delta_r][col + delta_c] != nil
      temp = delta_c
      delta_c = -delta_r
      delta_r = temp
    end
  end
  spiral_indices.flatten!

  # Calculate the bit width required
  # We assume the max integer is (max score value) * (number of pieces)
  # Also watch out for the case where num_metrics
  max_integer = [values.flatten.max * num_pieces, num_metrics, num_pieces].max
  bit_width = (Math.log(max_integer, 2)).ceil + 1

  template_string = <<-eos
open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  diag1 : one Int,
  diag2 : one Int,
<% metric_ids.each do |metric| %>
  <%= metric %> : one Int<%= "," unless metric_ids[-1] == metric %>
<% end %>
}

// Define concrete positions
<% positions.each_with_index do |position, index| %>
<%   spiral_index = spiral_indices.find_index(index) %>
<%   # Row and column are based on the position's index within the spiral %>
<%   row = spiral_index / num_pieces %>
<%   col = spiral_index % num_pieces %>
<%   diag1 = diag_indices[spiral_index][:one] %>
<%   diag2 = diag_indices[spiral_index][:two] %>
one sig position_<%= index %> extends Position {}
{
  row = <%= row %>
  col = <%= col %>
  diag1 = <%= diag1 %>
  diag2 = <%= diag2 %>
<% metric_ids.each_with_index do |metric, index2| %>
  <%= metric %> = <%= position["metrics"][index2] %>
<% end %>
}
<% end %>

// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Queen,
  positions : set Position,
<% metric_ids.each do |metric| %>
  <%= metric %> : one Int<%= "," unless metric_ids[-1] == metric %>
<% end %>
}
{
  Queen in pieces

  // Queens can't attack each other
  all q1 : pieces, q2 : pieces | (q1.position.row = q2.position.row => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.col = q2.position.col => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.diag1 = q2.position.diag1 => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.diag2 = q2.position.diag2 => q1 = q2)

  // Compute the scores
<% metric_ids.each do |metric| %>
  <%= metric %> = (sum p : positions | p.<%= metric %>)
<% end %>
}

// Set the pieces on the board
fact { all q : Queen | (q.board = Board) }
fact { all p : Position | (p in Board.positions) => (some q : Board.pieces | q.position = p) }
fact { all q : Queen | (q.position in Board.positions) }

// Declare the Moolloy problem instance
inst QueensProblem {
  <%= bit_width %> Int,
  exactly <%= num_pieces %> Queen
}

// Set the objectives
objectives o_global {
<% metric_ids.each_with_index do |id, index| %>
  maximize Board.<%= id %><%= "," unless metric_ids[-1] == id %>
<% end %>
}

run show for QueensProblem optimize o_global
eos

  template = ERB.new( template_string, 0, "<>" )

  File.open("queens_#{num_pieces}_metrics_#{num_metrics}.als", "w") do |f|
    f.puts template.result(binding)
  end

  puts "Created Alloy file for queens_#{num_pieces}_metrics_#{num_metrics}"
end



if ARGV.size != 2 && ARGV.size != 4
  puts "Usage: #{$PROGRAM_NAME} num_pieces num_metrics"
  puts "Usage: #{$PROGRAM_NAME} min_pieces max_pieces min_metrics max_metrics"
  exit
end

num_pieces = num_metrics = nil
min_pieces = max_pieces = min_metrics = max_metrics = nil

# Load the YAML file with all the values we need
data = YAML::load_file "../values.yaml"

if ARGV.size == 2
  num_pieces, num_metrics = ARGV[0..1].collect(&:to_i)
  write_one_problem(data, num_pieces, num_metrics)
elsif ARGV.size == 4
  min_pieces, max_pieces, min_metrics, max_metrics = ARGV[0..3].collect(&:to_i)
  (min_pieces..max_pieces).each do |num_pieces|
    (min_metrics..max_metrics).each do |num_metrics|
      write_one_problem(data, num_pieces, num_metrics)
    end
  end
end
