open util/integer
pred show {}

// Define the Position signature
abstract sig Position { row : one Int, col : one Int, diagonal1 : one Int, diagonal2 : one Int, score1 : one Int, score2 : one Int, score3 : one Int, score4 : one Int, score5 : one Int }

one sig position_0_0 extends Position {}
{
  row = 0
  col = 0
  diagonal1 = 1
  diagonal2 = 4
  score1 = 0
  score2 = 1
  score3 = 1
  score4 = 2
  score5 = 1
}
one sig position_0_1 extends Position {}
{
  row = 0
  col = 1
  diagonal1 = 2
  diagonal2 = 3
  score1 = 3
  score2 = 3
  score3 = 4
  score4 = 2
  score5 = 1
}
one sig position_0_2 extends Position {}
{
  row = 0
  col = 2
  diagonal1 = 3
  diagonal2 = 2
  score1 = 1
  score2 = 1
  score3 = 4
  score4 = 3
  score5 = 2
}
one sig position_0_3 extends Position {}
{
  row = 0
  col = 3
  diagonal1 = 4
  diagonal2 = 1
  score1 = 3
  score2 = 4
  score3 = 0
  score4 = 2
  score5 = 4
}
one sig position_1_0 extends Position {}
{
  row = 1
  col = 0
  diagonal1 = 2
  diagonal2 = 5
  score1 = 2
  score2 = 1
  score3 = 0
  score4 = 0
  score5 = 4
}
one sig position_1_1 extends Position {}
{
  row = 1
  col = 1
  diagonal1 = 3
  diagonal2 = 4
  score1 = 3
  score2 = 0
  score3 = 3
  score4 = 4
  score5 = 0
}
one sig position_1_2 extends Position {}
{
  row = 1
  col = 2
  diagonal1 = 4
  diagonal2 = 3
  score1 = 1
  score2 = 2
  score3 = 3
  score4 = 2
  score5 = 3
}
one sig position_1_3 extends Position {}
{
  row = 1
  col = 3
  diagonal1 = 5
  diagonal2 = 2
  score1 = 2
  score2 = 3
  score3 = 0
  score4 = 3
  score5 = 1
}
one sig position_2_0 extends Position {}
{
  row = 2
  col = 0
  diagonal1 = 3
  diagonal2 = 6
  score1 = 4
  score2 = 4
  score3 = 0
  score4 = 0
  score5 = 4
}
one sig position_2_1 extends Position {}
{
  row = 2
  col = 1
  diagonal1 = 4
  diagonal2 = 5
  score1 = 3
  score2 = 4
  score3 = 4
  score4 = 3
  score5 = 1
}
one sig position_2_2 extends Position {}
{
  row = 2
  col = 2
  diagonal1 = 5
  diagonal2 = 4
  score1 = 2
  score2 = 0
  score3 = 2
  score4 = 1
  score5 = 1
}
one sig position_2_3 extends Position {}
{
  row = 2
  col = 3
  diagonal1 = 6
  diagonal2 = 3
  score1 = 2
  score2 = 2
  score3 = 0
  score4 = 1
  score5 = 4
}
one sig position_3_0 extends Position {}
{
  row = 3
  col = 0
  diagonal1 = 4
  diagonal2 = 7
  score1 = 2
  score2 = 2
  score3 = 1
  score4 = 3
  score5 = 2
}
one sig position_3_1 extends Position {}
{
  row = 3
  col = 1
  diagonal1 = 5
  diagonal2 = 6
  score1 = 2
  score2 = 2
  score3 = 1
  score4 = 1
  score5 = 2
}
one sig position_3_2 extends Position {}
{
  row = 3
  col = 2
  diagonal1 = 6
  diagonal2 = 5
  score1 = 4
  score2 = 0
  score3 = 4
  score4 = 0
  score5 = 2
}
one sig position_3_3 extends Position {}
{
  row = 3
  col = 3
  diagonal1 = 7
  diagonal2 = 4
  score1 = 2
  score2 = 1
  score3 = 2
  score4 = 0
  score5 = 1
}

// Define the Queen signature
sig Queen { board : one Board, position : one Position }

// Define the Board signature
abstract sig Board { pieces : set Queen, positions : set Position, score1 : one Int, score2 : one Int, score3 : one Int, score4 : one Int, score5 : one Int }

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
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diagonal1 = q2.position.diagonal1 => q1 = q2) }
fact { all b : Board, q1 : b.pieces, q2 : b.pieces | (q1.position.diagonal2 = q2.position.diagonal2 => q1 = q2) }

// Compute the score
fact { all b : Board | b.score1 = (sum p : b.positions | p.score1) }
fact { all b : Board | b.score2 = (sum p : b.positions | p.score2) }
fact { all b : Board | b.score3 = (sum p : b.positions | p.score3) }
fact { all b : Board | b.score4 = (sum p : b.positions | p.score4) }
fact { all b : Board | b.score5 = (sum p : b.positions | p.score5) }

// Declare the Moolloy problem instance
inst queens {
  5 Int,
  exactly 4 Queen
}

// Set the objectives
objectives o_global {
  maximize ConcreteBoard.score1,
  maximize ConcreteBoard.score2,
  maximize ConcreteBoard.score3,
  maximize ConcreteBoard.score4,
  maximize ConcreteBoard.score5
}

run show for queens optimize o_global