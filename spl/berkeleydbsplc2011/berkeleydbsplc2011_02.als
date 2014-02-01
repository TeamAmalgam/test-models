open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable { footprint : one Int }

// Define the features
one sig HAVE_CRYPTO extends IMeasurable {}
{ footprint = 10 }

one sig HAVE_HASH extends IMeasurable {}
{ footprint = 56 }

one sig HAVE_QUEUE extends IMeasurable {}
{ footprint = 28 }

one sig HAVE_REPLICATION extends IMeasurable {}
{ footprint = 44 }

one sig HAVE_VERIFY extends IMeasurable {}
{ footprint = 25 }

one sig HAVE_SEQUENCE extends IMeasurable {}
{ footprint = 10 }

one sig HAVE_STATISTICS extends IMeasurable {}
{ footprint = 139 }

one sig DIAGNOSTIC extends IMeasurable {}
{ footprint = 54 }

one sig SYNTHETIC_BASE_FEATURE extends IMeasurable {}
{ footprint = 881 }

// Define BerkeleyDbC
one sig BerkeleyDbC
{
  features : set IMeasurable,
  totalFootprint : one Int
}

// Sum up the metrics
fact { BerkeleyDbC.totalFootprint = (sum f : BerkeleyDbC.features | f.footprint ) }

// Define the predicates: what features BerkeleyDbC must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // Must have SYNTHETIC_BASE_FEATURE
  SYNTHETIC_BASE_FEATURE in BerkeleyDbC.features

  // Define the constraints here:
  // No other constraints

  // Define the configuration here:
  HAVE_CRYPTO in BerkeleyDbC.features
  HAVE_REPLICATION not in BerkeleyDbC.features
  HAVE_STATISTICS in BerkeleyDbC.features
  SYNTHETIC_BASE_FEATURE in BerkeleyDbC.features
}

// Declare the Moolloy problem instance
inst config {
  12 Int,
  exactly 1 BerkeleyDbC
}

// Set the objective(s)
objectives o_global {
  minimize BerkeleyDbC.totalFootprint
}

run featureSet for config optimize o_global
