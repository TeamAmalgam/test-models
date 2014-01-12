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
  metric4 : one Int
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
}

// Define the Rook signature
sig Rook { board : one Board, position : one Position }

// Define the Board signature
abstract sig Board {
  pieces : set Rook,
  positions : set Position,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int,
  metric3 : one Int,
  metric4 : one Int
}

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
fact { all b : Board | b.metric0 = (sum p : b.positions | p.metric0) }
fact { all b : Board | b.metric1 = (sum p : b.positions | p.metric1) }
fact { all b : Board | b.metric2 = (sum p : b.positions | p.metric2) }
fact { all b : Board | b.metric3 = (sum p : b.positions | p.metric3) }
fact { all b : Board | b.metric4 = (sum p : b.positions | p.metric4) }

// Declare the Moolloy problem instance
inst RooksProblem {
  6 Int,
  exactly 3 Rook
}

// Set the objectives
objectives o_global {
  maximize ConcreteBoard.metric0,
  maximize ConcreteBoard.metric1,
  maximize ConcreteBoard.metric2,
  maximize ConcreteBoard.metric3,
  maximize ConcreteBoard.metric4
}

run show for RooksProblem optimize o_global
