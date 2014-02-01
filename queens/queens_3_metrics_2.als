open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  diag1 : one Int,
  diag2 : one Int,
  metric0 : one Int,
  metric1 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 1
  col = 1
  diag1 = 2
  diag2 = 2
  metric0 = 2
  metric1 = 2
}
one sig position_1 extends Position {}
{
  row = 1
  col = 0
  diag1 = 1
  diag2 = 3
  metric0 = 2
  metric1 = 2
}
one sig position_2 extends Position {}
{
  row = 2
  col = 0
  diag1 = 2
  diag2 = 4
  metric0 = 0
  metric1 = 0
}
one sig position_3 extends Position {}
{
  row = 2
  col = 1
  diag1 = 3
  diag2 = 3
  metric0 = 6
  metric1 = 0
}
one sig position_4 extends Position {}
{
  row = 2
  col = 2
  diag1 = 4
  diag2 = 2
  metric0 = 3
  metric1 = 1
}
one sig position_5 extends Position {}
{
  row = 1
  col = 2
  diag1 = 3
  diag2 = 1
  metric0 = 9
  metric1 = 7
}
one sig position_6 extends Position {}
{
  row = 0
  col = 2
  diag1 = 2
  diag2 = 0
  metric0 = 5
  metric1 = 6
}
one sig position_7 extends Position {}
{
  row = 0
  col = 1
  diag1 = 1
  diag2 = 1
  metric0 = 6
  metric1 = 8
}
one sig position_8 extends Position {}
{
  row = 0
  col = 0
  diag1 = 0
  diag2 = 2
  metric0 = 7
  metric1 = 1
}

// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Queen,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int
}
{
  Queen in pieces

  // Queens can't attack each other
  all q1 : pieces, q2 : pieces | (q1.position.row = q2.position.row => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.col = q2.position.col => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.diag1 = q2.position.diag1 => q1 = q2)
  all q1 : pieces, q2 : pieces | (q1.position.diag2 = q2.position.diag2 => q1 = q2)

  // Compute the scores
  metric0 = (sum p : positions | p.metric0)
  metric1 = (sum p : positions | p.metric1)
}

// Set the pieces on the board
fact { all q : Queen | (q.board = Board) }
fact { all p : Position | (p in Board.positions) => (some q : Board.pieces | q.position = p) }
fact { all q : Queen | (q.position in Board.positions) }

// Declare the Moolloy problem instance
inst QueensProblem {
  6 Int,
  exactly 3 Queen
}

// Set the objectives
objectives o_global {
  maximize Board.metric0,
  maximize Board.metric1
}

run show for QueensProblem optimize o_global
