open util/integer
pred show {}

abstract sig Item {
  weight : one Int,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int
}

one sig Knapsack {
  items : set Item,
  max_weight : one Int,
  current_weight : one Int,
  metric0 : one Int,
  metric1 : one Int,
  metric2 : one Int
}
{
  max_weight = 100

  // Metric of the knapsack is sum of item metrics
  metric0 = (sum i : items | i.metric0)
  metric1 = (sum i : items | i.metric1)
  metric2 = (sum i : items | i.metric2)

  // Weight of knapsack is sum of item weights
  current_weight = (sum i : items | i.weight)

  // Weight of knapsack must be less than the max weight
  current_weight <= max_weight
}

// Define concrete items
one sig Item0 extends Item {} {
  weight = 2
  metric0 = 2
  metric1 = 2
  metric2 = 4
}
one sig Item1 extends Item {} {
  weight = 0
  metric0 = 2
  metric1 = 2
  metric2 = 8
}
one sig Item2 extends Item {} {
  weight = 1
  metric0 = 0
  metric1 = 0
  metric2 = 4
}
one sig Item3 extends Item {} {
  weight = 0
  metric0 = 6
  metric1 = 0
  metric2 = 2
}
one sig Item4 extends Item {} {
  weight = 7
  metric0 = 3
  metric1 = 1
  metric2 = 9
}
one sig Item5 extends Item {} {
  weight = 8
  metric0 = 9
  metric1 = 7
  metric2 = 3
}
one sig Item6 extends Item {} {
  weight = 2
  metric0 = 5
  metric1 = 6
  metric2 = 0
}
one sig Item7 extends Item {} {
  weight = 0
  metric0 = 6
  metric1 = 8
  metric2 = 5
}
one sig Item8 extends Item {} {
  weight = 8
  metric0 = 7
  metric1 = 1
  metric2 = 6
}
one sig Item9 extends Item {} {
  weight = 3
  metric0 = 8
  metric1 = 8
  metric2 = 8
}
one sig Item10 extends Item {} {
  weight = 5
  metric0 = 9
  metric1 = 7
  metric2 = 9
}
one sig Item11 extends Item {} {
  weight = 0
  metric0 = 2
  metric1 = 9
  metric2 = 0
}
one sig Item12 extends Item {} {
  weight = 2
  metric0 = 2
  metric1 = 7
  metric2 = 5
}
one sig Item13 extends Item {} {
  weight = 2
  metric0 = 6
  metric1 = 1
  metric2 = 2
}
one sig Item14 extends Item {} {
  weight = 3
  metric0 = 6
  metric1 = 4
  metric2 = 3
}

inst KnapsackProblem {
  8 Int
}

objectives o_global {
  maximize Knapsack.metric0,
  maximize Knapsack.metric1,
  maximize Knapsack.metric2
}

run show for KnapsackProblem optimize o_global
