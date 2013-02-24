open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable { performance : one Int }

// Define the features
one sig Base extends IMeasurable {}
{ performance = 150 }

one sig HostnameLookups extends IMeasurable {}
{ performance = -26 }

one sig KeepAlive extends IMeasurable {}
{ performance = 105 }

one sig EnableSendfile extends IMeasurable {}
{ performance = 15 }

one sig FollowSymLinks extends IMeasurable {}
{ performance = 0 }

one sig AccessLog extends IMeasurable {}
{ performance = -15 }

one sig ExtendedStatus extends IMeasurable {}
{ performance = -11 }

one sig InMemory extends IMeasurable {}
{ performance = 26 }

one sig Handle extends IMeasurable {}
{ performance = 4 }

// Define Apache
sig Apache
{
  features : set IMeasurable,
  totalPerformance : one Int
}

// Sum up the performances
fact { all a : Apache | a.totalPerformance = (sum f : a.features | f.performance ) }

// Define the predicates: what features Apache must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // Only Base is *required* to be in the feature set
  Base in Apache.features

  // Define the constraints here:
  // InMemory means we can't have Handle
  (InMemory in Apache.features) => (Handle not in Apache.features)

  // Define the configuration here:
  Base in Apache.features
  HostnameLookups in Apache.features
  KeepAlive in Apache.features
  EnableSendfile not in Apache.features
  FollowSymLinks in Apache.features
  ExtendedStatus in Apache.features
  Handle not in Apache.features
}

// Declare the Moolloy problem instance
inst config {
  10 Int,
  exactly 1 Apache
}

// Set the objective(s)
objectives o_global {
  maximize Apache.totalPerformance
}

run featureSet for config optimize o_global
