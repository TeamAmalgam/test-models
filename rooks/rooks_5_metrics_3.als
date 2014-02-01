open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 2
  col = 2
  metric0 = 2
  metric1 = 2
  metric2 = 4
}
one sig position_1 extends Position {}
{
  row = 2
  col = 1
  metric0 = 2
  metric1 = 2
  metric2 = 8
}
one sig position_2 extends Position {}
{
  row = 3
  col = 1
  metric0 = 0
  metric1 = 0
  metric2 = 4
}
one sig position_3 extends Position {}
{
  row = 3
  col = 2
  metric0 = 6
  metric1 = 0
  metric2 = 2
}
one sig position_4 extends Position {}
{
  row = 3
  col = 3
  metric0 = 3
  metric1 = 1
  metric2 = 9
}
one sig position_5 extends Position {}
{
  row = 2
  col = 3
  metric0 = 9
  metric1 = 7
  metric2 = 3
}
one sig position_6 extends Position {}
{
  row = 1
  col = 3
  metric0 = 5
  metric1 = 6
  metric2 = 0
}
one sig position_7 extends Position {}
{
  row = 1
  col = 2
  metric0 = 6
  metric1 = 8
  metric2 = 5
}
one sig position_8 extends Position {}
{
  row = 1
  col = 1
  metric0 = 7
  metric1 = 1
  metric2 = 6
}
one sig position_9 extends Position {}
{
  row = 1
  col = 0
  metric0 = 8
  metric1 = 8
  metric2 = 8
}
one sig position_10 extends Position {}
{
  row = 2
  col = 0
  metric0 = 9
  metric1 = 7
  metric2 = 9
}
one sig position_11 extends Position {}
{
  row = 3
  col = 0
  metric0 = 2
  metric1 = 9
  metric2 = 0
}
one sig position_12 extends Position {}
{
  row = 4
  col = 0
  metric0 = 2
  metric1 = 7
  metric2 = 5
}
one sig position_13 extends Position {}
{
  row = 4
  col = 1
  metric0 = 6
  metric1 = 1
  metric2 = 2
}
one sig position_14 extends Position {}
{
  row = 4
  col = 2
  metric0 = 6
  metric1 = 4
  metric2 = 3
}
one sig position_15 extends Position {}
{
  row = 4
  col = 3
  metric0 = 1
  metric1 = 9
  metric2 = 3
}
one sig position_16 extends Position {}
{
  row = 4
  col = 4
  metric0 = 5
  metric1 = 3
  metric2 = 3
}
one sig position_17 extends Position {}
{
  row = 3
  col = 4
  metric0 = 5
  metric1 = 6
  metric2 = 4
}
one sig position_18 extends Position {}
{
  row = 2
  col = 4
  metric0 = 8
  metric1 = 4
  metric2 = 5
}
one sig position_19 extends Position {}
{
  row = 1
  col = 4
  metric0 = 2
  metric1 = 4
  metric2 = 1
}
one sig position_20 extends Position {}
{
  row = 0
  col = 4
  metric0 = 7
  metric1 = 2
  metric2 = 4
}
one sig position_21 extends Position {}
{
  row = 0
  col = 3
  metric0 = 5
  metric1 = 7
  metric2 = 4
}
one sig position_22 extends Position {}
{
  row = 0
  col = 2
  metric0 = 3
  metric1 = 8
  metric2 = 5
}
one sig position_23 extends Position {}
{
  row = 0
  col = 1
  metric0 = 6
  metric1 = 4
  metric2 = 9
}
one sig position_24 extends Position {}
{
  row = 0
  col = 0
  metric0 = 3
  metric1 = 4
  metric2 = 7
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Rook,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int
}
{
  Rook in pieces

  // Rooks can't attack each other
  all r1 : pieces, r2 : pieces | (r1.position.row = r2.position.row => r1 = r2)
  all r1 : pieces, r2 : pieces | (r1.position.col = r2.position.col => r1 = r2)

  // Compute the scores
  metric0 = (sum p : positions | p.metric0)
  metric1 = (sum p : positions | p.metric1)
  metric2 = (sum p : positions | p.metric2)
}

// Set the pieces on the board
fact { all r : Rook | (r.board = Board) }
fact { all p : Position | (p in Board.positions) => (some r : Board.pieces | r.position = p) }
fact { all r : Rook | (r.position in Board.positions) }

// Declare the Moolloy problem instance
inst RooksProblem {
  7 Int,
  exactly 5 Rook
}

// Set the objectives
objectives o_global {
  maximize Board.metric0,
  maximize Board.metric1,
  maximize Board.metric2
}

run show for RooksProblem optimize o_global
