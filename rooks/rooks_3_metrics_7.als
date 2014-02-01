open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int,
  metric4 : one Int,
  metric5 : one Int,
  metric6 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 1
  col = 1
  metric0 = 2
  metric1 = 2
  metric2 = 4
  metric3 = 9
  metric4 = 8
  metric5 = 5
  metric6 = 5
}
one sig position_1 extends Position {}
{
  row = 1
  col = 0
  metric0 = 2
  metric1 = 2
  metric2 = 8
  metric3 = 2
  metric4 = 6
  metric5 = 7
  metric6 = 5
}
one sig position_2 extends Position {}
{
  row = 2
  col = 0
  metric0 = 0
  metric1 = 0
  metric2 = 4
  metric3 = 2
  metric4 = 3
  metric5 = 6
  metric6 = 0
}
one sig position_3 extends Position {}
{
  row = 2
  col = 1
  metric0 = 6
  metric1 = 0
  metric2 = 2
  metric3 = 5
  metric4 = 9
  metric5 = 6
  metric6 = 2
}
one sig position_4 extends Position {}
{
  row = 2
  col = 2
  metric0 = 3
  metric1 = 1
  metric2 = 9
  metric3 = 2
  metric4 = 3
  metric5 = 8
  metric6 = 4
}
one sig position_5 extends Position {}
{
  row = 1
  col = 2
  metric0 = 9
  metric1 = 7
  metric2 = 3
  metric3 = 3
  metric4 = 1
  metric5 = 1
  metric6 = 4
}
one sig position_6 extends Position {}
{
  row = 0
  col = 2
  metric0 = 5
  metric1 = 6
  metric2 = 0
  metric3 = 3
  metric4 = 3
  metric5 = 3
  metric6 = 9
}
one sig position_7 extends Position {}
{
  row = 0
  col = 1
  metric0 = 6
  metric1 = 8
  metric2 = 5
  metric3 = 2
  metric4 = 8
  metric5 = 9
  metric6 = 5
}
one sig position_8 extends Position {}
{
  row = 0
  col = 0
  metric0 = 7
  metric1 = 1
  metric2 = 6
  metric3 = 0
  metric4 = 9
  metric5 = 2
  metric6 = 2
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Rook,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int,
  metric4 : one Int,
  metric5 : one Int,
  metric6 : one Int
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
  metric3 = (sum p : positions | p.metric3)
  metric4 = (sum p : positions | p.metric4)
  metric5 = (sum p : positions | p.metric5)
  metric6 = (sum p : positions | p.metric6)
}

// Set the pieces on the board
fact { all r : Rook | (r.board = Board) }
fact { all p : Position | (p in Board.positions) => (some r : Board.pieces | r.position = p) }
fact { all r : Rook | (r.position in Board.positions) }

// Declare the Moolloy problem instance
inst RooksProblem {
  6 Int,
  exactly 3 Rook
}

// Set the objectives
objectives o_global {
  maximize Board.metric0,
  maximize Board.metric1,
  maximize Board.metric2,
  maximize Board.metric3,
  maximize Board.metric4,
  maximize Board.metric5,
  maximize Board.metric6
}

run show for RooksProblem optimize o_global
