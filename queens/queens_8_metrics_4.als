open util/integer
pred show {}

// Define the Position signature
abstract sig Position {
  row : one Int,
  col : one Int,
  diag1 : one Int,
  diag2 : one Int,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 4
  col = 3
  diag1 = 7
  diag2 = 8
  metric0 = 2
  metric1 = 2
  metric2 = 4
  metric3 = 9
}
one sig position_1 extends Position {}
{
  row = 4
  col = 4
  diag1 = 8
  diag2 = 7
  metric0 = 2
  metric1 = 2
  metric2 = 8
  metric3 = 2
}
one sig position_2 extends Position {}
{
  row = 3
  col = 4
  diag1 = 7
  diag2 = 6
  metric0 = 0
  metric1 = 0
  metric2 = 4
  metric3 = 2
}
one sig position_3 extends Position {}
{
  row = 3
  col = 3
  diag1 = 6
  diag2 = 7
  metric0 = 6
  metric1 = 0
  metric2 = 2
  metric3 = 5
}
one sig position_4 extends Position {}
{
  row = 3
  col = 2
  diag1 = 5
  diag2 = 8
  metric0 = 3
  metric1 = 1
  metric2 = 9
  metric3 = 2
}
one sig position_5 extends Position {}
{
  row = 4
  col = 2
  diag1 = 6
  diag2 = 9
  metric0 = 9
  metric1 = 7
  metric2 = 3
  metric3 = 3
}
one sig position_6 extends Position {}
{
  row = 5
  col = 2
  diag1 = 7
  diag2 = 10
  metric0 = 5
  metric1 = 6
  metric2 = 0
  metric3 = 3
}
one sig position_7 extends Position {}
{
  row = 5
  col = 3
  diag1 = 8
  diag2 = 9
  metric0 = 6
  metric1 = 8
  metric2 = 5
  metric3 = 2
}
one sig position_8 extends Position {}
{
  row = 5
  col = 4
  diag1 = 9
  diag2 = 8
  metric0 = 7
  metric1 = 1
  metric2 = 6
  metric3 = 0
}
one sig position_9 extends Position {}
{
  row = 5
  col = 5
  diag1 = 10
  diag2 = 7
  metric0 = 8
  metric1 = 8
  metric2 = 8
  metric3 = 8
}
one sig position_10 extends Position {}
{
  row = 4
  col = 5
  diag1 = 9
  diag2 = 6
  metric0 = 9
  metric1 = 7
  metric2 = 9
  metric3 = 1
}
one sig position_11 extends Position {}
{
  row = 3
  col = 5
  diag1 = 8
  diag2 = 5
  metric0 = 2
  metric1 = 9
  metric2 = 0
  metric3 = 1
}
one sig position_12 extends Position {}
{
  row = 2
  col = 5
  diag1 = 7
  diag2 = 4
  metric0 = 2
  metric1 = 7
  metric2 = 5
  metric3 = 7
}
one sig position_13 extends Position {}
{
  row = 2
  col = 4
  diag1 = 6
  diag2 = 5
  metric0 = 6
  metric1 = 1
  metric2 = 2
  metric3 = 1
}
one sig position_14 extends Position {}
{
  row = 2
  col = 3
  diag1 = 5
  diag2 = 6
  metric0 = 6
  metric1 = 4
  metric2 = 3
  metric3 = 0
}
one sig position_15 extends Position {}
{
  row = 2
  col = 2
  diag1 = 4
  diag2 = 7
  metric0 = 1
  metric1 = 9
  metric2 = 3
  metric3 = 7
}
one sig position_16 extends Position {}
{
  row = 2
  col = 1
  diag1 = 3
  diag2 = 8
  metric0 = 5
  metric1 = 3
  metric2 = 3
  metric3 = 8
}
one sig position_17 extends Position {}
{
  row = 3
  col = 1
  diag1 = 4
  diag2 = 9
  metric0 = 5
  metric1 = 6
  metric2 = 4
  metric3 = 5
}
one sig position_18 extends Position {}
{
  row = 4
  col = 1
  diag1 = 5
  diag2 = 10
  metric0 = 8
  metric1 = 4
  metric2 = 5
  metric3 = 9
}
one sig position_19 extends Position {}
{
  row = 5
  col = 1
  diag1 = 6
  diag2 = 11
  metric0 = 2
  metric1 = 4
  metric2 = 1
  metric3 = 5
}
one sig position_20 extends Position {}
{
  row = 6
  col = 1
  diag1 = 7
  diag2 = 12
  metric0 = 7
  metric1 = 2
  metric2 = 4
  metric3 = 4
}
one sig position_21 extends Position {}
{
  row = 6
  col = 2
  diag1 = 8
  diag2 = 11
  metric0 = 5
  metric1 = 7
  metric2 = 4
  metric3 = 9
}
one sig position_22 extends Position {}
{
  row = 6
  col = 3
  diag1 = 9
  diag2 = 10
  metric0 = 3
  metric1 = 8
  metric2 = 5
  metric3 = 3
}
one sig position_23 extends Position {}
{
  row = 6
  col = 4
  diag1 = 10
  diag2 = 9
  metric0 = 6
  metric1 = 4
  metric2 = 9
  metric3 = 9
}
one sig position_24 extends Position {}
{
  row = 6
  col = 5
  diag1 = 11
  diag2 = 8
  metric0 = 3
  metric1 = 4
  metric2 = 7
  metric3 = 6
}
one sig position_25 extends Position {}
{
  row = 6
  col = 6
  diag1 = 12
  diag2 = 7
  metric0 = 3
  metric1 = 7
  metric2 = 7
  metric3 = 1
}
one sig position_26 extends Position {}
{
  row = 5
  col = 6
  diag1 = 11
  diag2 = 6
  metric0 = 8
  metric1 = 9
  metric2 = 4
  metric3 = 6
}
one sig position_27 extends Position {}
{
  row = 4
  col = 6
  diag1 = 10
  diag2 = 5
  metric0 = 8
  metric1 = 0
  metric2 = 8
  metric3 = 2
}
one sig position_28 extends Position {}
{
  row = 3
  col = 6
  diag1 = 9
  diag2 = 4
  metric0 = 5
  metric1 = 9
  metric2 = 7
  metric3 = 5
}
one sig position_29 extends Position {}
{
  row = 2
  col = 6
  diag1 = 8
  diag2 = 3
  metric0 = 5
  metric1 = 8
  metric2 = 0
  metric3 = 5
}
one sig position_30 extends Position {}
{
  row = 1
  col = 6
  diag1 = 7
  diag2 = 2
  metric0 = 9
  metric1 = 9
  metric2 = 0
  metric3 = 5
}
one sig position_31 extends Position {}
{
  row = 1
  col = 5
  diag1 = 6
  diag2 = 3
  metric0 = 9
  metric1 = 3
  metric2 = 4
  metric3 = 4
}
one sig position_32 extends Position {}
{
  row = 1
  col = 4
  diag1 = 5
  diag2 = 4
  metric0 = 2
  metric1 = 2
  metric2 = 5
  metric3 = 5
}
one sig position_33 extends Position {}
{
  row = 1
  col = 3
  diag1 = 4
  diag2 = 5
  metric0 = 1
  metric1 = 3
  metric2 = 0
  metric3 = 0
}
one sig position_34 extends Position {}
{
  row = 1
  col = 2
  diag1 = 3
  diag2 = 6
  metric0 = 8
  metric1 = 7
  metric2 = 6
  metric3 = 4
}
one sig position_35 extends Position {}
{
  row = 1
  col = 1
  diag1 = 2
  diag2 = 7
  metric0 = 4
  metric1 = 2
  metric2 = 1
  metric3 = 4
}
one sig position_36 extends Position {}
{
  row = 1
  col = 0
  diag1 = 1
  diag2 = 8
  metric0 = 5
  metric1 = 8
  metric2 = 0
  metric3 = 6
}
one sig position_37 extends Position {}
{
  row = 2
  col = 0
  diag1 = 2
  diag2 = 9
  metric0 = 3
  metric1 = 2
  metric2 = 6
  metric3 = 7
}
one sig position_38 extends Position {}
{
  row = 3
  col = 0
  diag1 = 3
  diag2 = 10
  metric0 = 9
  metric1 = 0
  metric2 = 9
  metric3 = 8
}
one sig position_39 extends Position {}
{
  row = 4
  col = 0
  diag1 = 4
  diag2 = 11
  metric0 = 9
  metric1 = 6
  metric2 = 7
  metric3 = 1
}
one sig position_40 extends Position {}
{
  row = 5
  col = 0
  diag1 = 5
  diag2 = 12
  metric0 = 0
  metric1 = 3
  metric2 = 1
  metric3 = 9
}
one sig position_41 extends Position {}
{
  row = 6
  col = 0
  diag1 = 6
  diag2 = 13
  metric0 = 9
  metric1 = 1
  metric2 = 2
  metric3 = 8
}
one sig position_42 extends Position {}
{
  row = 7
  col = 0
  diag1 = 7
  diag2 = 14
  metric0 = 3
  metric1 = 6
  metric2 = 9
  metric3 = 5
}
one sig position_43 extends Position {}
{
  row = 7
  col = 1
  diag1 = 8
  diag2 = 13
  metric0 = 3
  metric1 = 5
  metric2 = 6
  metric3 = 2
}
one sig position_44 extends Position {}
{
  row = 7
  col = 2
  diag1 = 9
  diag2 = 12
  metric0 = 0
  metric1 = 1
  metric2 = 1
  metric3 = 8
}
one sig position_45 extends Position {}
{
  row = 7
  col = 3
  diag1 = 10
  diag2 = 11
  metric0 = 3
  metric1 = 2
  metric2 = 9
  metric3 = 6
}
one sig position_46 extends Position {}
{
  row = 7
  col = 4
  diag1 = 11
  diag2 = 10
  metric0 = 8
  metric1 = 1
  metric2 = 6
  metric3 = 7
}
one sig position_47 extends Position {}
{
  row = 7
  col = 5
  diag1 = 12
  diag2 = 9
  metric0 = 1
  metric1 = 2
  metric2 = 6
  metric3 = 5
}
one sig position_48 extends Position {}
{
  row = 7
  col = 6
  diag1 = 13
  diag2 = 8
  metric0 = 0
  metric1 = 8
  metric2 = 1
  metric3 = 2
}
one sig position_49 extends Position {}
{
  row = 7
  col = 7
  diag1 = 14
  diag2 = 7
  metric0 = 7
  metric1 = 1
  metric2 = 2
  metric3 = 8
}
one sig position_50 extends Position {}
{
  row = 6
  col = 7
  diag1 = 13
  diag2 = 6
  metric0 = 5
  metric1 = 5
  metric2 = 4
  metric3 = 5
}
one sig position_51 extends Position {}
{
  row = 5
  col = 7
  diag1 = 12
  diag2 = 5
  metric0 = 3
  metric1 = 2
  metric2 = 0
  metric3 = 9
}
one sig position_52 extends Position {}
{
  row = 4
  col = 7
  diag1 = 11
  diag2 = 4
  metric0 = 1
  metric1 = 4
  metric2 = 7
  metric3 = 7
}
one sig position_53 extends Position {}
{
  row = 3
  col = 7
  diag1 = 10
  diag2 = 3
  metric0 = 1
  metric1 = 6
  metric2 = 1
  metric3 = 8
}
one sig position_54 extends Position {}
{
  row = 2
  col = 7
  diag1 = 9
  diag2 = 2
  metric0 = 8
  metric1 = 3
  metric2 = 6
  metric3 = 3
}
one sig position_55 extends Position {}
{
  row = 1
  col = 7
  diag1 = 8
  diag2 = 1
  metric0 = 9
  metric1 = 5
  metric2 = 4
  metric3 = 3
}
one sig position_56 extends Position {}
{
  row = 0
  col = 7
  diag1 = 7
  diag2 = 0
  metric0 = 7
  metric1 = 3
  metric2 = 5
  metric3 = 9
}
one sig position_57 extends Position {}
{
  row = 0
  col = 6
  diag1 = 6
  diag2 = 1
  metric0 = 1
  metric1 = 3
  metric2 = 9
  metric3 = 7
}
one sig position_58 extends Position {}
{
  row = 0
  col = 5
  diag1 = 5
  diag2 = 2
  metric0 = 7
  metric1 = 2
  metric2 = 9
  metric3 = 4
}
one sig position_59 extends Position {}
{
  row = 0
  col = 4
  diag1 = 4
  diag2 = 3
  metric0 = 8
  metric1 = 8
  metric2 = 0
  metric3 = 6
}
one sig position_60 extends Position {}
{
  row = 0
  col = 3
  diag1 = 3
  diag2 = 4
  metric0 = 9
  metric1 = 9
  metric2 = 9
  metric3 = 8
}
one sig position_61 extends Position {}
{
  row = 0
  col = 2
  diag1 = 2
  diag2 = 5
  metric0 = 9
  metric1 = 0
  metric2 = 3
  metric3 = 6
}
one sig position_62 extends Position {}
{
  row = 0
  col = 1
  diag1 = 1
  diag2 = 6
  metric0 = 0
  metric1 = 1
  metric2 = 6
  metric3 = 6
}
one sig position_63 extends Position {}
{
  row = 0
  col = 0
  diag1 = 0
  diag2 = 7
  metric0 = 2
  metric1 = 0
  metric2 = 8
  metric3 = 2
}

// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
one sig Board {
  pieces : set Queen,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int
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
  metric2 = (sum p : positions | p.metric2)
  metric3 = (sum p : positions | p.metric3)
}

// Set the pieces on the board
fact { all q : Queen | (q.board = Board) }
fact { all p : Position | (p in Board.positions) => (some q : Board.pieces | q.position = p) }
fact { all q : Queen | (q.position in Board.positions) }

// Declare the Moolloy problem instance
inst QueensProblem {
  8 Int,
  exactly 8 Queen
}

// Set the objectives
objectives o_global {
  maximize Board.metric0,
  maximize Board.metric1,
  maximize Board.metric2,
  maximize Board.metric3
}

run show for QueensProblem optimize o_global
