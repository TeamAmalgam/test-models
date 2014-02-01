open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable {
  price : one Int,
  footprint : one Int,
  reliability : one Int
}

// Define the features
one sig HAVE_STATISTICS extends IMeasurable {}
{
  footprint = 139
  price = 0
  reliability = 0
}

one sig HAVE_CRYPTO extends IMeasurable {}
{
  footprint = 19
  price = 300
  reliability = 0
}

one sig HAVE_INDEXES extends IMeasurable {}
{
  footprint = 0
  price = 0
  reliability = 0
}

one sig HAVE_BTREE extends IMeasurable {}
{
  footprint = 0
  price = 0
  reliability = 0
}

one sig BTREE_FAST extends IMeasurable {}
{
  footprint = 1800
  price = 0
  reliability = 0
}

one sig BTREE_SMALL extends IMeasurable {}
{
  footprint = 340
  price = 0
  reliability = 0
}

one sig HAVE_HASH extends IMeasurable {}
{
  footprint = 56
  price = 125
  reliability = 0
}

one sig HAVE_QUEUE extends IMeasurable {}
{
  footprint = 28
  price = 50
  reliability = 0
}

one sig HAVE_REPLICATION extends IMeasurable {}
{
  footprint = 89
  price = 200
  reliability = 1
}

one sig HAVE_VERIFY extends IMeasurable {}
{
  footprint = 50
  price = 100
  reliability = 1
}

one sig DIAGNOSTIC extends IMeasurable {}
{
  footprint = 191
  price = 0
  reliability = 1
}

one sig HAVE_SEQUENCE extends IMeasurable {}
{
  footprint = 20
  price = 50
  reliability = 0
}

// Define BerkeleyDbC
one sig BerkeleyDbC
{
  features : set IMeasurable,
  totalFootprint : one Int,
  totalPrice : one Int,
  totalReliability : one Int
}

// Sum up the metrics
fact { BerkeleyDbC.totalFootprint = (sum f : BerkeleyDbC.features | f.footprint ) }
fact { BerkeleyDbC.totalPrice = (sum f : BerkeleyDbC.features | f.price ) }
fact { BerkeleyDbC.totalReliability = (sum f : BerkeleyDbC.features | f.reliability ) }

// Define the predicates, what features BerkeleyDbC must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // HAVE_INDEXES and HAVE_BTREE *must* be present
  HAVE_INDEXES in BerkeleyDbC.features
  HAVE_BTREE in BerkeleyDbC.features

  // Must have exactly one of BTREE_FAST or BTREE_SMALL
  one ((BTREE_FAST + BTREE_SMALL) & BerkeleyDbC.features)

  // Define the constraints here:
  // No other constraints
}

// Declare the Moolloy problem instance
inst config {
  13 Int,
  exactly 1 BerkeleyDbC
}

// Set the objectives
objectives o_global {
  minimize BerkeleyDbC.totalFootprint,
  minimize BerkeleyDbC.totalPrice,
  maximize BerkeleyDbC.totalReliability
}

run featureSet for config optimize o_global
