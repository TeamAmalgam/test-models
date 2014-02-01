open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  metric0 : one Int,
  metric1 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 3
  col = 3
  metric0 = 2
  metric1 = 2
}
one sig position_1 extends Position {}
{
  row = 3
  col = 2
  metric0 = 2
  metric1 = 2
}
one sig position_2 extends Position {}
{
  row = 4
  col = 2
  metric0 = 0
  metric1 = 0
}
one sig position_3 extends Position {}
{
  row = 4
  col = 3
  metric0 = 6
  metric1 = 0
}
one sig position_4 extends Position {}
{
  row = 4
  col = 4
  metric0 = 3
  metric1 = 1
}
one sig position_5 extends Position {}
{
  row = 3
  col = 4
  metric0 = 9
  metric1 = 7
}
one sig position_6 extends Position {}
{
  row = 2
  col = 4
  metric0 = 5
  metric1 = 6
}
one sig position_7 extends Position {}
{
  row = 2
  col = 3
  metric0 = 6
  metric1 = 8
}
one sig position_8 extends Position {}
{
  row = 2
  col = 2
  metric0 = 7
  metric1 = 1
}
one sig position_9 extends Position {}
{
  row = 2
  col = 1
  metric0 = 8
  metric1 = 8
}
one sig position_10 extends Position {}
{
  row = 3
  col = 1
  metric0 = 9
  metric1 = 7
}
one sig position_11 extends Position {}
{
  row = 4
  col = 1
  metric0 = 2
  metric1 = 9
}
one sig position_12 extends Position {}
{
  row = 5
  col = 1
  metric0 = 2
  metric1 = 7
}
one sig position_13 extends Position {}
{
  row = 5
  col = 2
  metric0 = 6
  metric1 = 1
}
one sig position_14 extends Position {}
{
  row = 5
  col = 3
  metric0 = 6
  metric1 = 4
}
one sig position_15 extends Position {}
{
  row = 5
  col = 4
  metric0 = 1
  metric1 = 9
}
one sig position_16 extends Position {}
{
  row = 5
  col = 5
  metric0 = 5
  metric1 = 3
}
one sig position_17 extends Position {}
{
  row = 4
  col = 5
  metric0 = 5
  metric1 = 6
}
one sig position_18 extends Position {}
{
  row = 3
  col = 5
  metric0 = 8
  metric1 = 4
}
one sig position_19 extends Position {}
{
  row = 2
  col = 5
  metric0 = 2
  metric1 = 4
}
one sig position_20 extends Position {}
{
  row = 1
  col = 5
  metric0 = 7
  metric1 = 2
}
one sig position_21 extends Position {}
{
  row = 1
  col = 4
  metric0 = 5
  metric1 = 7
}
one sig position_22 extends Position {}
{
  row = 1
  col = 3
  metric0 = 3
  metric1 = 8
}
one sig position_23 extends Position {}
{
  row = 1
  col = 2
  metric0 = 6
  metric1 = 4
}
one sig position_24 extends Position {}
{
  row = 1
  col = 1
  metric0 = 3
  metric1 = 4
}
one sig position_25 extends Position {}
{
  row = 1
  col = 0
  metric0 = 3
  metric1 = 7
}
one sig position_26 extends Position {}
{
  row = 2
  col = 0
  metric0 = 8
  metric1 = 9
}
one sig position_27 extends Position {}
{
  row = 3
  col = 0
  metric0 = 8
  metric1 = 0
}
one sig position_28 extends Position {}
{
  row = 4
  col = 0
  metric0 = 5
  metric1 = 9
}
one sig position_29 extends Position {}
{
  row = 5
  col = 0
  metric0 = 5
  metric1 = 8
}
one sig position_30 extends Position {}
{
  row = 6
  col = 0
  metric0 = 9
  metric1 = 9
}
one sig position_31 extends Position {}
{
  row = 6
  col = 1
  metric0 = 9
  metric1 = 3
}
one sig position_32 extends Position {}
{
  row = 6
  col = 2
  metric0 = 2
  metric1 = 2
}
one sig position_33 extends Position {}
{
  row = 6
  col = 3
  metric0 = 1
  metric1 = 3
}
one sig position_34 extends Position {}
{
  row = 6
  col = 4
  metric0 = 8
  metric1 = 7
}
one sig position_35 extends Position {}
{
  row = 6
  col = 5
  metric0 = 4
  metric1 = 2
}
one sig position_36 extends Position {}
{
  row = 6
  col = 6
  metric0 = 5
  metric1 = 8
}
one sig position_37 extends Position {}
{
  row = 5
  col = 6
  metric0 = 3
  metric1 = 2
}
one sig position_38 extends Position {}
{
  row = 4
  col = 6
  metric0 = 9
  metric1 = 0
}
one sig position_39 extends Position {}
{
  row = 3
  col = 6
  metric0 = 9
  metric1 = 6
}
one sig position_40 extends Position {}
{
  row = 2
  col = 6
  metric0 = 0
  metric1 = 3
}
one sig position_41 extends Position {}
{
  row = 1
  col = 6
  metric0 = 9
  metric1 = 1
}
one sig position_42 extends Position {}
{
  row = 0
  col = 6
  metric0 = 3
  metric1 = 6
}
one sig position_43 extends Position {}
{
  row = 0
  col = 5
  metric0 = 3
  metric1 = 5
}
one sig position_44 extends Position {}
{
  row = 0
  col = 4
  metric0 = 0
  metric1 = 1
}
one sig position_45 extends Position {}
{
  row = 0
  col = 3
  metric0 = 3
  metric1 = 2
}
one sig position_46 extends Position {}
{
  row = 0
  col = 2
  metric0 = 8
  metric1 = 1
}
one sig position_47 extends Position {}
{
  row = 0
  col = 1
  metric0 = 1
  metric1 = 2
}
one sig position_48 extends Position {}
{
  row = 0
  col = 0
  metric0 = 0
  metric1 = 8
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Rook,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int
}
{
  Rook in pieces

  // Rooks can't attack each other
  all r1 : pieces, r2 : pieces | (r1.position.row = r2.position.row => r1 = r2)
  all r1 : pieces, r2 : pieces | (r1.position.col = r2.position.col => r1 = r2)

  // Compute the scores
  metric0 = (sum p : positions | p.metric0)
  metric1 = (sum p : positions | p.metric1)
}

// Set the pieces on the board
fact { all r : Rook | (r.board = Board) }
fact { all p : Position | (p in Board.positions) => (some r : Board.pieces | r.position = p) }
fact { all r : Rook | (r.position in Board.positions) }

// Declare the Moolloy problem instance
inst RooksProblem {
  7 Int,
  exactly 7 Rook
}

// Set the objectives
objectives o_global {
  maximize Board.metric0,
  maximize Board.metric1
}

run show for RooksProblem optimize o_global
