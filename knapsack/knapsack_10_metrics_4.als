  open util/integer
  pred show {}
  
  abstract sig Item {
    weight : one Int,
    
      metric0 : one Int ,
    
      metric1 : one Int ,
    
      metric2 : one Int ,
    
      metric3 : one Int 
    
  }

  abstract sig Knapsack {
    items : set Item,
    max_weight : one Int,
    current_weight : one Int,
    
      metric0 : one Int ,
    
      metric1 : one Int ,
    
      metric2 : one Int ,
    
      metric3 : one Int 
    
  }

  // Metric of the knapsack is sum of item metrics
  
    fact { all k : Knapsack | k.metric0 = (sum i : k.items | i.metric0)}
  
    fact { all k : Knapsack | k.metric1 = (sum i : k.items | i.metric1)}
  
    fact { all k : Knapsack | k.metric2 = (sum i : k.items | i.metric2)}
  
    fact { all k : Knapsack | k.metric3 = (sum i : k.items | i.metric3)}
  

  // Weight of knapsack is sum of item weights
  fact { all k : Knapsack | k.current_weight = (sum i : k.items | i.weight)}
  
  // Weight of knapsack must be less than the max weight
  fact { all k : Knapsack | k.current_weight <= k.max_weight }

  // Define concrete items
  
    one sig Item0 extends Item {} {
      weight = 4
      
        metric0 = 9 
      
        metric1 = 9 
      
        metric2 = 8 
      
        metric3 = 2 
      
    }
  
    one sig Item1 extends Item {} {
      weight = 6
      
        metric0 = 0 
      
        metric1 = 3 
      
        metric2 = 3 
      
        metric3 = 7 
      
    }
  
    one sig Item2 extends Item {} {
      weight = 1
      
        metric0 = 2 
      
        metric1 = 3 
      
        metric2 = 4 
      
        metric3 = 8 
      
    }
  
    one sig Item3 extends Item {} {
      weight = 1
      
        metric0 = 3 
      
        metric1 = 8 
      
        metric2 = 7 
      
        metric3 = 8 
      
    }
  
    one sig Item4 extends Item {} {
      weight = 4
      
        metric0 = 0 
      
        metric1 = 9 
      
        metric2 = 8 
      
        metric3 = 1 
      
    }
  
    one sig Item5 extends Item {} {
      weight = 0
      
        metric0 = 1 
      
        metric1 = 10 
      
        metric2 = 9 
      
        metric3 = 5 
      
    }
  
    one sig Item6 extends Item {} {
      weight = 7
      
        metric0 = 6 
      
        metric1 = 6 
      
        metric2 = 6 
      
        metric3 = 2 
      
    }
  
    one sig Item7 extends Item {} {
      weight = 4
      
        metric0 = 9 
      
        metric1 = 6 
      
        metric2 = 8 
      
        metric3 = 3 
      
    }
  
    one sig Item8 extends Item {} {
      weight = 6
      
        metric0 = 3 
      
        metric1 = 2 
      
        metric2 = 9 
      
        metric3 = 1 
      
    }
  
    one sig Item9 extends Item {} {
      weight = 7
      
        metric0 = 7 
      
        metric1 = 5 
      
        metric2 = 1 
      
        metric3 = 7 
      
    }
  

  // Define concrete knapsack
  one sig ConcreteKnapsack extends Knapsack {} {
    max_weight = 100
  }

  inst KnapsackProblem {
    8 Int
  }

  objectives o_global {
    
      maximize ConcreteKnapsack.metric0 ,
    
      maximize ConcreteKnapsack.metric1 ,
    
      maximize ConcreteKnapsack.metric2 ,
    
      maximize ConcreteKnapsack.metric3 
    
  }

  run show for KnapsackProblem optimize o_global
