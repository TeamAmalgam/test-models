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
  (ElementA in LinkedList.features) or (ElementB in LinkedList.features) or (ElementC in LinkedList.features)
  (ElementA in LinkedList.features) => ((ElementB not in LinkedList.features) and (ElementC not in LinkedList.features))
  (ElementB in LinkedList.features) => ((ElementA not in LinkedList.features) and (ElementC not in LinkedList.features))
  (ElementC in LinkedList.features) => ((ElementA not in LinkedList.features) and (ElementB not in LinkedList.features))

  // Must have exactly one of ForwardIterator or BackwardIterator
  (ForwardIterator in LinkedList.features) or (BackwardIterator in LinkedList.features)
  (ForwardIterator in LinkedList.features) => (BackwardIterator not in LinkedList.features)
  (BackwardIterator in LinkedList.features) => (ForwardIterator not in LinkedList.features)

  // If we choose AbstractSort, then we must have exactly one of BubbleSort, MergeSort, InsertionSort, or QuickSort
  (AbstractSort in LinkedList.features) => ((BubbleSort in LinkedList.features) or (MergeSort in LinkedList.features) or (InsertionSort in LinkedList.features) or (QuickSort in LinkedList.features))
  (BubbleSort in LinkedList.features) => ((AbstractSort in LinkedList.features) and (MergeSort not in LinkedList.features) and (InsertionSort not in LinkedList.features) and (QuickSort not in LinkedList.features))
  (MergeSort in LinkedList.features) => ((AbstractSort in LinkedList.features) and (BubbleSort not in LinkedList.features) and (InsertionSort not in LinkedList.features) and (QuickSort not in LinkedList.features))
  (InsertionSort in LinkedList.features) => ((AbstractSort in LinkedList.features) and (BubbleSort not in LinkedList.features) and (MergeSort not in LinkedList.features) and (QuickSort not in LinkedList.features))
  (QuickSort in LinkedList.features) => ((AbstractSort in LinkedList.features) and (BubbleSort not in LinkedList.features) and (MergeSort not in LinkedList.features) and (InsertionSort not in LinkedList.features))

  // We choose Measurement iff we choose TCP_IP and SyntheticPerformanceOrMemorySize
  (Measurement in LinkedList.features) <=> (TCP_IP in LinkedList.features)
  (Measurement in LinkedList.features) <=> (SyntheticPerformanceOrMemorySize in LinkedList.features)

  // If we choose SyntheticPerformanceOrMemorySize, we must have at least one of Performance or MemorySize
  (SyntheticPerformanceOrMemorySize in LinkedList.features) => ((Performance in LinkedList.features) or (MemorySize not in LinkedList.features))

  // Define the constraints here:
  // If we choose Measurement, we must also choose AbstractSort
  (Measurement in LinkedList.features) => (AbstractSort in LinkedList.features)
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
