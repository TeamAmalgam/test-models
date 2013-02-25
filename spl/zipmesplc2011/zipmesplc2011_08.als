open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable { footprint : one Int }

// Define the features
one sig base extends IMeasurable {}
{ footprint = 796 }

one sig zipMe extends IMeasurable {}
{ footprint = 0 }

one sig zipMecompress extends IMeasurable {}
{ footprint = 0 }

one sig zipMeCRC extends IMeasurable {}
{ footprint = 16 }

one sig zipMearchiveCheck extends IMeasurable {}
{ footprint = 3 }

one sig zipMeGZIP extends IMeasurable {}
{ footprint = 58 }

one sig zipMeadaptation extends IMeasurable {}
{ footprint = 3 }

one sig zipMeadler32Chcksum extends IMeasurable {}
{ footprint = 0 }

one sig zipMeextract extends IMeasurable { }
{ footprint = 69 }

// Define ZipMeSPL
sig ZipMeSPL
{
  features : set IMeasurable,
  totalFootprint : one Int
}

// Sum up the performances
fact { all z : ZipMeSPL | z.totalFootprint = (sum f : z.features | f.footprint ) }

// Define the predicates: what features ZipMeSPL must have, and their relationships
pred featureSet
{
  // All the other features exist in the universe, and may or may not be in the feature set
  // Only Base, zipMe and zipMeCompress are *required* to be in the feature set
  base in ZipMeSPL.features
  zipMe in ZipMeSPL.features
  zipMecompress in ZipMeSPL.features

  // Define the constraints here:
  zipMearchiveCheck not in ZipMeSPL.features
  zipMeGZIP in ZipMeSPL.features
  zipMeadaptation in ZipMeSPL.features
  zipMeextract in ZipMeSPL.features
}

inst config {
  11 Int,
  exactly 1 ZipMeSPL
}

objectives o_global {
  minimize ZipMeSPL.totalFootprint
}

run featureSet for config optimize o_global
