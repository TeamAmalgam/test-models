  open util/integer
  pred show {}
  
  abstract sig Item {
    weight : one Int,
    
      metric0 : one Int ,
    
      metric1 : one Int 
    
  }

  abstract sig Knapsack {
    items : set Item,
    max_weight : one Int,
    current_weight : one Int,
    
      metric0 : one Int ,
    
      metric1 : one Int 
    
  }

  // Metric of the knapsack is sum of item metrics
  
    fact { all k : Knapsack | k.metric0 = (sum i : k.items | i.metric0)}
  
    fact { all k : Knapsack | k.metric1 = (sum i : k.items | i.metric1)}
  

  // Weight of knapsack is sum of item weights
  fact { all k : Knapsack | k.current_weight = (sum i : k.items | i.weight)}
  
  // Weight of knapsack must be less than the max weight
  fact { all k : Knapsack | k.current_weight <= k.max_weight }

  // Define concrete items
  
    one sig Item0 extends Item {} {
      weight = 2
      
        metric0 = 2 
      
        metric1 = 1 
      
    }
  
    one sig Item1 extends Item {} {
      weight = 4
      
        metric0 = 4 
      
        metric1 = 3 
      
    }
  
    one sig Item2 extends Item {} {
      weight = 8
      
        metric0 = 9 
      
        metric1 = 0 
      
    }
  

  // Define concrete knapsack
  one sig ConcreteKnapsack extends Knapsack {} {
    max_weight = 10
  }

  inst KnapsackProblem {
    5 Int
  }

  objectives o_global {
    
      maximize ConcreteKnapsack.metric0 ,
    
      maximize ConcreteKnapsack.metric1 
    
  }

  run show for KnapsackProblem optimize o_global
