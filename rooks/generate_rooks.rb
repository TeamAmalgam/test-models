#!/usr/bin/env ruby

# Get n (size of board) and m (number of metrics) from args
abort "Need to pass in n (size of board) and m (number of metrics)" if ARGV.empty?
n = ARGV[0].to_i
m = ARGV[1].to_i
abort "Numbers must be positive" if n <= 0 or m <= 0
filename = "rooks_#{n}_metrics_#{m}.als"

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
pos_sig = "abstract sig Position { row : one Int, col : one Int"
(1..m).to_a.each{ |i| pos_sig << ", score#{i} : one Int" }
pos_sig << " }\n\n"
file.write(pos_sig)

# Create each of the concrete positions of the board
(0..n-1).to_a.each do |row|
  (0..n-1).to_a.each do |col|
    file.write("one sig position_#{row}_#{col} extends Position {}\n")
    file.write("{\n")
    file.write("  row = #{row}\n")
    file.write("  col = #{col}\n")

    # Create random score(s) for each position
    (1..m).to_a.each do |s|
      score = rand(n + 1)
      file.write("  score#{s} = #{score}\n")
    end

    file.write("}\n")
  end
end
file.write("\n")

# Rook signature
file.write(
<<-eos
// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
eos
)

board_sig = "abstract sig Board { pieces : set Rook, positions : set Position"
(1..m).to_a.each{ |i| board_sig << ", score#{i} : one Int" }
board_sig << " }\n\n"
file.write(board_sig)

file.write(
<<-eos
// Set the pieces on the board
fact { all b : Board, r : Rook | (r in b.pieces) <=> (r.board = b) }
fact { all b : Board, p : Position | (p in b.positions) => (some r : b.pieces | r.position = p) }
fact { all b : Board, r : Rook | (r.position in b.positions) }

// Define a ConcreteBoard with pieces
one sig ConcreteBoard extends Board {}
fact { Rook in ConcreteBoard.pieces }

// Add constraints so rooks can't attack each other
fact { all b : Board, r1 : b.pieces, r2 : b.pieces | (r1.position.row = r2.position.row => r1 = r2) }
fact { all b : Board, r1 : b.pieces, r2 : b.pieces | (r1.position.col = r2.position.col => r1 = r2) }

// Compute the score
eos
)

(1..m).to_a.each do |i|
  file.write("fact { all b : Board | b.score#{i} = (sum p : b.positions | p.score#{i}) }\n")
end
file.write("\n")

# We assume the max total score is (max score value) * (number of pieces) = n * n
# Since we're only adding that many scores
# We also need to watch out for the case where m > n*n
maxInteger = [n*n, m].max
bit_width = (Math.log(maxInteger, 2)).ceil + 1

file.write(
<<-eos
// Declare the Moolloy problem instance
inst rooks {
  #{bit_width} Int,
  exactly #{n} Rook
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

file.write("run show for rooks optimize o_global")

file.close unless file.nil?
