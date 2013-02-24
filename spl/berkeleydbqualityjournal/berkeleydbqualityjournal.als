open util/integer
pred show {}

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

abstract sig HAVE_INDEXES extends IMeasurable {}
{
}

abstract sig HAVE_BTREE extends HAVE_INDEXES {}
{
}

one sig BTREE_FAST extends HAVE_BTREE {}
{
  footprint = 1800
  price = 0
  reliability = 0
}

one sig BTREE_SMALL extends HAVE_BTREE {}
{
  footprint = 340
  price = 0
  reliability = 0
}

one sig HAVE_HASH extends HAVE_INDEXES {}
{
  footprint = 56
  price = 125
  reliability = 0
}

one sig HAVE_QUEUE extends HAVE_INDEXES {}
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
fact { all b : BerkeleyDbC | b.totalFootprint = (sum f : b.features | f.footprint ) }
fact { all b : BerkeleyDbC | b.totalPrice = (sum f : b.features | f.price ) }
fact { all b : BerkeleyDbC | b.totalReliability = (sum f : b.features | f.reliability ) }

// Define the predicates, what features Apache must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  some (HAVE_INDEXES & BerkeleyDbC.features)
  some (HAVE_BTREE & BerkeleyDbC.features)
  (BTREE_FAST in BerkeleyDbC.features) => (BTREE_SMALL not in BerkeleyDbC.features)
  (BTREE_SMALL in BerkeleyDbC.features) => (BTREE_FAST not in BerkeleyDbC.features)

  // Define the constraints here:
  // No other constraints
}

// Declare the Moolloy problem instance
inst config {
  10 Int,
  exactly 1 BerkeleyDbC
}

// Set the objectives
objectives o_global {
  minimize BerkeleyDbC.totalFootprint,
  minimize BerkeleyDbC.totalPrice,
  maximize BerkeleyDbC.totalReliability
}

run featureSet for config optimize o_global
