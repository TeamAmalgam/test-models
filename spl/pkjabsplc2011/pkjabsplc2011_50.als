open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable {
  footprint : one Int
}

// Define the features
one sig Base extends IMeasurable {}
{ footprint = 696 }

one sig ContactListSource extends IMeasurable {}
{ footprint = 0 }

one sig ServerRoster extends IMeasurable {}
{ footprint = 0 }

one sig XEP0085 extends IMeasurable {}
{ footprint = 27 }

one sig Composing extends IMeasurable {}
{ footprint = 0 }

one sig SendComposing extends IMeasurable {}
{ footprint = 13 }

one sig History extends IMeasurable {}
{ footprint = 5 }

one sig Timestamps extends IMeasurable {}
{ footprint = 3 }

one sig XEP0092 extends IMeasurable {}
{ footprint = 0 }

one sig SendVersion extends IMeasurable {}
{ footprint = 5 }

one sig ThemeSelection extends IMeasurable {}
{ footprint = 58 }

// Define PKJab
one sig PKJab
{
  features : set IMeasurable,
  totalFootprint : one Int
}

// Sum the metrics
fact { all p : PKJab | p.totalFootprint = (sum f : p.features | f.footprint) }

// Define the predicates, what features LinkedList must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // Base, ContactListSource, and ServerRoster must be present
  Base in PKJab.features
  ContactListSource in PKJab.features
  ServerRoster in PKJab.features

  // Define the constraints here:
  // If we choose XEP0085, we must choose Composing
  // And if we choose Composing, we must choose XEP0085
  (XEP0085 in PKJab.features) <=> (Composing in PKJab.features)

  // If we choose SendComposing, we must choose XEP0085
  (SendComposing in PKJab.features) => (XEP0085 in PKJab.features)

  // If we choose SendVersion, we must choose XEP0092
  (SendVersion in PKJab.features) => (XEP0092 in PKJab.features)

  // Define the configuration here:
  Base in PKJab.features
  Composing in PKJab.features
  SendComposing in PKJab.features
  History in PKJab.features
  XEP0092 in PKJab.features
  SendVersion in PKJab.features
  ThemeSelection not in PKJab.features
}

// Declare the Moolloy problem instance
inst config {
  11 Int,
  exactly 1 PKJab
}

// Set the objectives
objectives o_global {
  minimize PKJab.totalFootprint
}

run featureSet for config optimize o_global
