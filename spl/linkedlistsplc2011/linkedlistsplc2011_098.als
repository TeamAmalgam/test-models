open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable {
  footprint : one Int
}

// Define the features
one sig AbstractElement extends IMeasurable {}
{ footprint = -12 }

one sig ElementA extends IMeasurable {}
{ footprint = 12 }

one sig ElementB extends IMeasurable {}
{ footprint = 0 }

one sig ElementC extends IMeasurable {}
{ footprint = 0 }

one sig AbstractIterator extends IMeasurable {}
{ footprint = 0 }

one sig ForwardIterator extends IMeasurable {}
{ footprint = 0 }

one sig BackwardIterator extends IMeasurable {}
{ footprint = 1 }

one sig AbstractSort extends IMeasurable {}
{ footprint = 57 }

one sig BubbleSort extends IMeasurable {}
{ footprint = 17 }

one sig MergeSort extends IMeasurable {}
{ footprint = 32 }

one sig InsertionSort extends IMeasurable {}
{ footprint = 0 }

one sig QuickSort extends IMeasurable {}
{ footprint = 22 }

one sig print extends IMeasurable {}
{ footprint = 44 }

one sig Measurement extends IMeasurable {}
{ footprint = 484 }

one sig TCP_IP extends IMeasurable {}
{ footprint = 0 }

one sig SyntheticPerformanceOrMemorySize extends IMeasurable {}
{ footprint = 0 }

one sig Performance extends IMeasurable {}
{ footprint = 37 }

one sig MemorySize extends IMeasurable {}
{ footprint = 36 }

one sig Base extends IMeasurable {}
{ footprint = 455 }

// Define LinkedList
one sig LinkedList
{
  features : set IMeasurable,
  totalFootprint : one Int
}

// Sum up the metrics
fact { all l : LinkedList | l.totalFootprint = (sum f : l.features | f.footprint ) }

// Define the predicates, what features LinkedList must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // AbstractElement, AbstractIterator, and Base *must* be present
  AbstractElement in LinkedList.features
  AbstractIterator in LinkedList.features
  Base in LinkedList.features

  // Must have exactly one of ElementA, ElementB, or ElementC
  one ((ElementA + ElementB + ElementC) & LinkedList.features)

  // Must have exactly one of ForwardIterator or BackwardIterator
  one ((ForwardIterator + BackwardIterator) & LinkedList.features)

  // If we choose AbstractSort, then we must have exactly one of BubbleSort, MergeSort, InsertionSort, or QuickSort
  // If we choose BubbleSort, MergeSort, InsertionSort, or Quicksort, then we must have AbstractSort
  (AbstractSort in LinkedList.features) <=> (one ((BubbleSort + MergeSort + InsertionSort + QuickSort) & LinkedList.features))
  lone ((BubbleSort + MergeSort + InsertionSort + QuickSort) & LinkedList.features)

  // We choose Measurement iff we choose TCP_IP and SyntheticPerformanceOrMemorySize
  (Measurement in LinkedList.features) <=> (TCP_IP in LinkedList.features)
  (Measurement in LinkedList.features) <=> (SyntheticPerformanceOrMemorySize in LinkedList.features)

  // If we choose SyntheticPerformanceOrMemorySize, we must have at least one of Performance or MemorySize
  (SyntheticPerformanceOrMemorySize in LinkedList.features) => ((Performance in LinkedList.features) or (MemorySize in LinkedList.features))

  // Define the constraints here:
  // If we choose Measurement, we must also choose AbstractSort
  (Measurement in LinkedList.features) => (AbstractSort in LinkedList.features)

  // Define the configuration here:
  AbstractElement in LinkedList.features
  ElementB not in LinkedList.features
  ElementC in LinkedList.features
  AbstractIterator in LinkedList.features
  ForwardIterator in LinkedList.features
  BackwardIterator not in LinkedList.features
  MergeSort in LinkedList.features
  QuickSort not in LinkedList.features
  print not in LinkedList.features
  SyntheticPerformanceOrMemorySize in LinkedList.features
  MemorySize not in LinkedList.features
  Base in LinkedList.features
}

// Declare the Moolloy problem instance
inst config {
  12 Int,
  exactly 1 LinkedList
}

// Set the objectives
objectives o_global {
  minimize LinkedList.totalFootprint
}

run featureSet for config optimize o_global
