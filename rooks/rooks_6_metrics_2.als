open util/integer
pred show {}

// Define the Position signature
abstract sig Position { row : one Int, col : one Int, score1 : one Int, score2 : one Int }

one sig position_0_0 extends Position {}
{
  row = 0
  col = 0
  score1 = 2
  score2 = 3
}
one sig position_0_1 extends Position {}
{
  row = 0
  col = 1
  score1 = 1
  score2 = 6
}
one sig position_0_2 extends Position {}
{
  row = 0
  col = 2
  score1 = 6
  score2 = 6
}
one sig position_0_3 extends Position {}
{
  row = 0
  col = 3
  score1 = 6
  score2 = 0
}
one sig position_0_4 extends Position {}
{
  row = 0
  col = 4
  score1 = 0
  score2 = 1
}
one sig position_0_5 extends Position {}
{
  row = 0
  col = 5
  score1 = 6
  score2 = 0
}
one sig position_1_0 extends Position {}
{
  row = 1
  col = 0
  score1 = 2
  score2 = 4
}
one sig position_1_1 extends Position {}
{
  row = 1
  col = 1
  score1 = 1
  score2 = 2
}
one sig position_1_2 extends Position {}
{
  row = 1
  col = 2
  score1 = 4
  score2 = 5
}
one sig position_1_3 extends Position {}
{
  row = 1
  col = 3
  score1 = 6
  score2 = 3
}
one sig position_1_4 extends Position {}
{
  row = 1
  col = 4
  score1 = 6
  score2 = 5
}
one sig position_1_5 extends Position {}
{
  row = 1
  col = 5
  score1 = 0
  score2 = 4
}
one sig position_2_0 extends Position {}
{
  row = 2
  col = 0
  score1 = 2
  score2 = 2
}
one sig position_2_1 extends Position {}
{
  row = 2
  col = 1
  score1 = 0
  score2 = 5
}
one sig position_2_2 extends Position {}
{
  row = 2
  col = 2
  score1 = 1
  score2 = 6
}
one sig position_2_3 extends Position {}
{
  row = 2
  col = 3
  score1 = 6
  score2 = 5
}
one sig position_2_4 extends Position {}
{
  row = 2
  col = 4
  score1 = 4
  score2 = 1
}
one sig position_2_5 extends Position {}
{
  row = 2
  col = 5
  score1 = 1
  score2 = 5
}
one sig position_3_0 extends Position {}
{
  row = 3
  col = 0
  score1 = 4
  score2 = 6
}
one sig position_3_1 extends Position {}
{
  row = 3
  col = 1
  score1 = 5
  score2 = 6
}
one sig position_3_2 extends Position {}
{
  row = 3
  col = 2
  score1 = 5
  score2 = 4
}
one sig position_3_3 extends Position {}
{
  row = 3
  col = 3
  score1 = 5
  score2 = 4
}
one sig position_3_4 extends Position {}
{
  row = 3
  col = 4
  score1 = 6
  score2 = 6
}
one sig position_3_5 extends Position {}
{
  row = 3
  col = 5
  score1 = 5
  score2 = 0
}
one sig position_4_0 extends Position {}
{
  row = 4
  col = 0
  score1 = 1
  score2 = 2
}
one sig position_4_1 extends Position {}
{
  row = 4
  col = 1
  score1 = 0
  score2 = 5
}
one sig position_4_2 extends Position {}
{
  row = 4
  col = 2
  score1 = 3
  score2 = 4
}
one sig position_4_3 extends Position {}
{
  row = 4
  col = 3
  score1 = 1
  score2 = 4
}
one sig position_4_4 extends Position {}
{
  row = 4
  col = 4
  score1 = 0
  score2 = 6
}
one sig position_4_5 extends Position {}
{
  row = 4
  col = 5
  score1 = 4
  score2 = 6
}
one sig position_5_0 extends Position {}
{
  row = 5
  col = 0
  score1 = 0
  score2 = 0
}
one sig position_5_1 extends Position {}
{
  row = 5
  col = 1
  score1 = 4
  score2 = 6
}
one sig position_5_2 extends Position {}
{
  row = 5
  col = 2
  score1 = 5
  score2 = 6
}
one sig position_5_3 extends Position {}
{
  row = 5
  col = 3
  score1 = 2
  score2 = 2
}
one sig position_5_4 extends Position {}
{
  row = 5
  col = 4
  score1 = 6
  score2 = 6
}
one sig position_5_5 extends Position {}
{
  row = 5
  col = 5
  score1 = 6
  score2 = 6
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
abstract sig Board { pieces : set Rook, positions : set Position, score1 : one Int, score2 : one Int }

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

// Declare the Moolloy problem instance
inst rooks {
  7 Int,
  exactly 6 Rook
}

// Set the objectives
objectives o_global {
  maximize ConcreteBoard.score1,
  maximize ConcreteBoard.score2
}

run show for rooks optimize o_global