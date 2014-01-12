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
  metric3 : one Int,
  metric4 : one Int,
  metric5 : one Int
}

// Define concrete positions
one sig position_0 extends Position {}
{
  row = 2
  col = 2
  diag1 = 4
  diag2 = 4
  metric0 = 2
  metric1 = 2
  metric2 = 4
  metric3 = 9
  metric4 = 8
  metric5 = 5
}
one sig position_1 extends Position {}
{
  row = 2
  col = 1
  diag1 = 3
  diag2 = 5
  metric0 = 2
  metric1 = 2
  metric2 = 8
  metric3 = 2
  metric4 = 6
  metric5 = 7
}
one sig position_2 extends Position {}
{
  row = 3
  col = 1
  diag1 = 4
  diag2 = 6
  metric0 = 0
  metric1 = 0
  metric2 = 4
  metric3 = 2
  metric4 = 3
  metric5 = 6
}
one sig position_3 extends Position {}
{
  row = 3
  col = 2
  diag1 = 5
  diag2 = 5
  metric0 = 6
  metric1 = 0
  metric2 = 2
  metric3 = 5
  metric4 = 9
  metric5 = 6
}
one sig position_4 extends Position {}
{
  row = 3
  col = 3
  diag1 = 6
  diag2 = 4
  metric0 = 3
  metric1 = 1
  metric2 = 9
  metric3 = 2
  metric4 = 3
  metric5 = 8
}
one sig position_5 extends Position {}
{
  row = 2
  col = 3
  diag1 = 5
  diag2 = 3
  metric0 = 9
  metric1 = 7
  metric2 = 3
  metric3 = 3
  metric4 = 1
  metric5 = 1
}
one sig position_6 extends Position {}
{
  row = 1
  col = 3
  diag1 = 4
  diag2 = 2
  metric0 = 5
  metric1 = 6
  metric2 = 0
  metric3 = 3
  metric4 = 3
  metric5 = 3
}
one sig position_7 extends Position {}
{
  row = 1
  col = 2
  diag1 = 3
  diag2 = 3
  metric0 = 6
  metric1 = 8
  metric2 = 5
  metric3 = 2
  metric4 = 8
  metric5 = 9
}
one sig position_8 extends Position {}
{
  row = 1
  col = 1
  diag1 = 2
  diag2 = 4
  metric0 = 7
  metric1 = 1
  metric2 = 6
  metric3 = 0
  metric4 = 9
  metric5 = 2
}
one sig position_9 extends Position {}
{
  row = 1
  col = 0
  diag1 = 1
  diag2 = 5
  metric0 = 8
  metric1 = 8
  metric2 = 8
  metric3 = 8
  metric4 = 8
  metric5 = 6
}
one sig position_10 extends Position {}
{
  row = 2
  col = 0
  diag1 = 2
  diag2 = 6
  metric0 = 9
  metric1 = 7
  metric2 = 9
  metric3 = 1
  metric4 = 8
  metric5 = 8
}
one sig position_11 extends Position {}
{
  row = 3
  col = 0
  diag1 = 3
  diag2 = 7
  metric0 = 2
  metric1 = 9
  metric2 = 0
  metric3 = 1
  metric4 = 2
  metric5 = 0
}
one sig position_12 extends Position {}
{
  row = 4
  col = 0
  diag1 = 4
  diag2 = 8
  metric0 = 2
  metric1 = 7
  metric2 = 5
  metric3 = 7
  metric4 = 9
  metric5 = 0
}
one sig position_13 extends Position {}
{
  row = 4
  col = 1
  diag1 = 5
  diag2 = 7
  metric0 = 6
  metric1 = 1
  metric2 = 2
  metric3 = 1
  metric4 = 0
  metric5 = 8
}
one sig position_14 extends Position {}
{
  row = 4
  col = 2
  diag1 = 6
  diag2 = 6
  metric0 = 6
  metric1 = 4
  metric2 = 3
  metric3 = 0
  metric4 = 5
  metric5 = 6
}
one sig position_15 extends Position {}
{
  row = 4
  col = 3
  diag1 = 7
  diag2 = 5
  metric0 = 1
  metric1 = 9
  metric2 = 3
  metric3 = 7
  metric4 = 3
  metric5 = 2
}
one sig position_16 extends Position {}
{
  row = 4
  col = 4
  diag1 = 8
  diag2 = 4
  metric0 = 5
  metric1 = 3
  metric2 = 3
  metric3 = 8
  metric4 = 9
  metric5 = 9
}
one sig position_17 extends Position {}
{
  row = 3
  col = 4
  diag1 = 7
  diag2 = 3
  metric0 = 5
  metric1 = 6
  metric2 = 4
  metric3 = 5
  metric4 = 4
  metric5 = 4
}
one sig position_18 extends Position {}
{
  row = 2
  col = 4
  diag1 = 6
  diag2 = 2
  metric0 = 8
  metric1 = 4
  metric2 = 5
  metric3 = 9
  metric4 = 8
  metric5 = 3
}
one sig position_19 extends Position {}
{
  row = 1
  col = 4
  diag1 = 5
  diag2 = 1
  metric0 = 2
  metric1 = 4
  metric2 = 1
  metric3 = 5
  metric4 = 5
  metric5 = 5
}
one sig position_20 extends Position {}
{
  row = 0
  col = 4
  diag1 = 4
  diag2 = 0
  metric0 = 7
  metric1 = 2
  metric2 = 4
  metric3 = 4
  metric4 = 6
  metric5 = 6
}
one sig position_21 extends Position {}
{
  row = 0
  col = 3
  diag1 = 3
  diag2 = 1
  metric0 = 5
  metric1 = 7
  metric2 = 4
  metric3 = 9
  metric4 = 4
  metric5 = 4
}
one sig position_22 extends Position {}
{
  row = 0
  col = 2
  diag1 = 2
  diag2 = 2
  metric0 = 3
  metric1 = 8
  metric2 = 5
  metric3 = 3
  metric4 = 8
  metric5 = 6
}
one sig position_23 extends Position {}
{
  row = 0
  col = 1
  diag1 = 1
  diag2 = 3
  metric0 = 6
  metric1 = 4
  metric2 = 9
  metric3 = 9
  metric4 = 9
  metric5 = 8
}
one sig position_24 extends Position {}
{
  row = 0
  col = 0
  diag1 = 0
  diag2 = 4
  metric0 = 3
  metric1 = 4
  metric2 = 7
  metric3 = 6
  metric4 = 5
  metric5 = 8
}

// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
abstract sig Board {
  pieces : set Queen,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int,
  metric4 : one Int,
  metric5 : one Int
}

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
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diag1 = q2.position.diag1 => q1 = q2) }
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diag2 = q2.position.diag2 => q1 = q2) }

// Compute the score
fact { all b : Board | b.metric0 = (sum p : b.positions | p.metric0) }
fact { all b : Board | b.metric1 = (sum p : b.positions | p.metric1) }
fact { all b : Board | b.metric2 = (sum p : b.positions | p.metric2) }
fact { all b : Board | b.metric3 = (sum p : b.positions | p.metric3) }
fact { all b : Board | b.metric4 = (sum p : b.positions | p.metric4) }
fact { all b : Board | b.metric5 = (sum p : b.positions | p.metric5) }

// Declare the Moolloy problem instance
inst QueensProblem {
  7 Int,
  exactly 5 Queen
}

// Set the objectives
objectives o_global {
  maximize ConcreteBoard.metric0,
  maximize ConcreteBoard.metric1,
  maximize ConcreteBoard.metric2,
  maximize ConcreteBoard.metric3,
  maximize ConcreteBoard.metric4,
  maximize ConcreteBoard.metric5
}

run show for QueensProblem optimize o_global
