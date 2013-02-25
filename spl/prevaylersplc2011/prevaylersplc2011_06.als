open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable { footprint : one Int }

// Define the features
one sig PrevaylerSPL extends IMeasurable {}
{ footprint = 873 }

one sig Replication extends IMeasurable {}
{ footprint = 523 }

one sig GZip extends IMeasurable {}
{ footprint = 54 }

one sig Censor extends IMeasurable {}
{ footprint = 50 }

one sig Monitor extends IMeasurable {}
{ footprint = 77 }

one sig Snapshot extends IMeasurable {}
{ footprint = 108 }

// Define Prevayler
sig Prevayler
{
  features : set IMeasurable,
  totalFootprint : one Int
}

// Sum up the metrics
fact { all p : Prevayler | p.totalFootprint = (sum f : p.features | f.footprint ) }

// Define the predicates: what features BerkeleyDbC must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // Must have PrevaylerSPL
  PrevaylerSPL in Prevayler.features

  // Define the constraints here:
  // If we choose Censor, we must also choose Snapshot
  (Censor in Prevayler.features) => (Snapshot in Prevayler.features)

  // Define the configuration here:
  Replication not in Prevayler.features
  GZip not in Prevayler.features
}

// Declare the Moolloy problem instance
inst config {
  12 Int,
  exactly 1 Prevayler
}

// Set the objective(s)
objectives o_global {
  minimize Prevayler.totalFootprint
}

run featureSet for config optimize o_global
