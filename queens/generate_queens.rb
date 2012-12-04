#!/usr/bin/env ruby

# Get n (size of board) and m (number of metrics) from args
abort "Need to pass in n (size of board) and m (number of metrics)" if ARGV.empty?
n = ARGV[0].to_i
m = ARGV[1].to_i
abort "Numbers must be positive" if n <= 0 or m <= 0
filename = "queens_#{n}_metrics_#{m}.als"

file = File.open(filename, 'w')

# Write multiline string to the file
file.write(
<<-eos
open util/integer
pred show {}

// Define the Position signature
eos
)

# Create the position signature. Need to append all the scores
pos_sig = "abstract sig Position { row : one Int, col : one Int, diagonal1 : one Int, diagonal2 : one Int"
(1..m).to_a.each{ |i| pos_sig << ", score#{i} : one Int" }
pos_sig << " }\n\n"
file.write(pos_sig)

# Create each of the concrete positions of the board
diagonal1start = 1
diagonal2start = n
(0..n-1).to_a.each do |row|
  diagonal1current = diagonal1start
  diagonal2current = diagonal2start
  (0..n-1).to_a.each do |col|
    file.write("one sig position_#{row}_#{col} extends Position {}\n")
    file.write("{\n")
    file.write("  row = #{row}\n")
    file.write("  col = #{col}\n")
    file.write("  diagonal1 = #{diagonal1current}\n")
    file.write("  diagonal2 = #{diagonal2current}\n")

    # Create random score(s) for each position
    (1..m).to_a.each do |s|
      score = rand(n + 1)
      file.write("  score#{s} = #{score}\n")
    end

    file.write("}\n")

    diagonal1current += 1
    diagonal2current -= 1
  end
  diagonal1start += 1
  diagonal2start += 1
end
file.write("\n")

# Queen signature
file.write(
<<-eos
// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
eos
)

board_sig = "abstract sig Board { pieces : set Queen, positions : set Position"
(1..m).to_a.each{ |i| board_sig << ", score#{i} : one Int" }
board_sig << " }\n\n"
file.write(board_sig)

file.write(
<<-eos
// Set the pieces on the board
fact { all b : Board, q : Queen | (q in b.pieces) <=> (q.board = b) }
fact { all b : Board, p : Position | (p in b.positions) => (some q : b.pieces | q.position = p) }
fact { all b : Board, q : Queen | (q.position in b.positions) }

// Define a ConcreteBoard with pieces
one sig ConcreteBoard extends Board {}
fact { Queen in ConcreteBoard.pieces }

// Add constraints so queens can't attack each other
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.row = q2.position.row => q1 = q2) }
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.col = q2.position.col => q1 = q2) }
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diagonal1 = q2.position.diagonal1 => q1 = q2) }
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diagonal2 = q2.position.diagonal2 => q1 = q2) }

// Compute the score
eos
)

(1..m).to_a.each do |i|
  file.write("fact { all b : Board | b.score#{i} = (sum p : b.positions | p.score#{i}) }\n")
end
file.write("\n")

file.write(
<<-eos
// Declare the Moolloy problem instance
inst queens {
  6 Int,
  exactly #{n} Queen
}

// Set the objectives
objectives o_global {
eos
)
(1..m-1).to_a.each do |i|
  file.write("  maximize ConcreteBoard.score#{i},\n")
end
file.write("  maximize ConcreteBoard.score#{m}\n")
file.write("}\n\n")

file.write("run show for queens optimize o_global")

file.close unless file.nil?
