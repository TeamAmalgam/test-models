open util/integer
pred show {}

// Define the Position signature
abstract sig Position { row : one Int, col : one Int, score1 : one Int, score2 : one Int, score3 : one Int }

one sig position_0_0 extends Position {}
{
  row = 0
  col = 0
  score1 = 2
  score2 = 0
  score3 = 3
}
one sig position_0_1 extends Position {}
{
  row = 0
  col = 1
  score1 = 3
  score2 = 3
  score3 = 1
}
one sig position_0_2 extends Position {}
{
  row = 0
  col = 2
  score1 = 3
  score2 = 4
  score3 = 1
}
one sig position_0_3 extends Position {}
{
  row = 0
  col = 3
  score1 = 4
  score2 = 3
  score3 = 4
}
one sig position_1_0 extends Position {}
{
  row = 1
  col = 0
  score1 = 4
  score2 = 2
  score3 = 4
}
one sig position_1_1 extends Position {}
{
  row = 1
  col = 1
  score1 = 0
  score2 = 3
  score3 = 4
}
one sig position_1_2 extends Position {}
{
  row = 1
  col = 2
  score1 = 0
  score2 = 4
  score3 = 4
}
one sig position_1_3 extends Position {}
{
  row = 1
  col = 3
  score1 = 3
  score2 = 2
  score3 = 0
}
one sig position_2_0 extends Position {}
{
  row = 2
  col = 0
  score1 = 2
  score2 = 1
  score3 = 3
}
one sig position_2_1 extends Position {}
{
  row = 2
  col = 1
  score1 = 0
  score2 = 3
  score3 = 1
}
one sig position_2_2 extends Position {}
{
  row = 2
  col = 2
  score1 = 2
  score2 = 2
  score3 = 0
}
one sig position_2_3 extends Position {}
{
  row = 2
  col = 3
  score1 = 4
  score2 = 4
  score3 = 2
}
one sig position_3_0 extends Position {}
{
  row = 3
  col = 0
  score1 = 0
  score2 = 2
  score3 = 1
}
one sig position_3_1 extends Position {}
{
  row = 3
  col = 1
  score1 = 0
  score2 = 4
  score3 = 1
}
one sig position_3_2 extends Position {}
{
  row = 3
  col = 2
  score1 = 3
  score2 = 1
  score3 = 1
}
one sig position_3_3 extends Position {}
{
  row = 3
  col = 3
  score1 = 4
  score2 = 3
  score3 = 0
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
abstract sig Board { pieces : set Rook, positions : set Position, score1 : one Int, score2 : one Int, score3 : one Int }

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
fact { all b : Board | b.score1 = (sum p : b.positions | p.score1) }
fact { all b : Board | b.score2 = (sum p : b.positions | p.score2) }
fact { all b : Board | b.score3 = (sum p : b.positions | p.score3) }

// Declare the Moolloy problem instance
inst rooks {
  5 Int,
  exactly 4 Rook
}

// Set the objectives
objectives o_global {
  maximize ConcreteBoard.score1,
  maximize ConcreteBoard.score2,
  maximize ConcreteBoard.score3
}

run show for rooks optimize o_global