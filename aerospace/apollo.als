open util/integer

// TODO: Two of the metric values are pretty complicated to express in Alloy
// This model will run, but is still incomplete

// Define the IMeasurable (attribute) signature
// Risk = -1000 * ln(value)
// IMLEO: Initial Mass in Low-Earth Orbit
abstract sig IMeasurable {
  IMLEO : one Int,
  risk : one Int
}

// Define the different decision variables and choices
// Decision vars are EOR, LOR, EarthLaunch, MoonArrival, MoonDeparture,
// CMCrew, LMCrew, SMFuel, and LMFuel

// Command module crew
one sig cmCrew_2 extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

one sig cmCrew_3 extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

// Lunar module crew
one sig lmCrew_0 extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

one sig lmCrew_1 extends IMeasurable {}
{
  IMLEO = 0
  risk = 105  // 0.9
}

one sig lmCrew_2 extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

one sig lmCrew_3 extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

one sig moonDeparture_orbit extends IMeasurable {}
{
  IMLEO = 0
  risk = 105  // 0.9
}

one sig moonDeparture_direct extends IMeasurable {}
{
  IMLEO = 0
  risk = 105  // 0.9
}

one sig earthLaunch_orbit extends IMeasurable {}
{
  IMLEO = 0
  risk = 10   // 0.99
}

one sig earthLaunch_direct extends IMeasurable {}
{
  IMLEO = 0
  risk = 105  // 0.9
}

one sig moonArrival_orbit extends IMeasurable {}
{
  IMLEO = 0
  risk = 10   // 0.99
}

one sig moonArrival_direct extends IMeasurable {}
{
  IMLEO = 0
  risk = 51   // 0.95
}

// Earth Orbit Rendezvous
one sig eor_yes extends IMeasurable {}
{
  IMLEO = 0
  risk = 51   // 0.95
}

one sig eor_no extends IMeasurable {}
{
  IMLEO = 0
  risk = 20   // 0.98
}

// Lunar Orbit Rendezvous
one sig lor_yes extends IMeasurable {}
{
  IMLEO = 0   // TODO: apollo_functions.IMLEO
  risk = 51   // 0.95
}

one sig lor_no extends IMeasurable {}
{
  IMLEO = 0   // TODO: apollo_functions.IMLEO
  risk = 0    // 1
}

// Service Module fuel
one sig smFuel_cryogenic extends IMeasurable {}
{
  IMLEO = 0
}
// Custom metric value for smFuel_cryogenic.risk
fact { (lor_yes in Apollo.choices) => (smFuel_cryogenic.risk = 102) else (smFuel_cryogenic.risk = 205) }


one sig smFuel_storable extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

// Lunar Module fuel
one sig lmFuel_cryogenic extends IMeasurable {}
{
  IMLEO = 0
  risk = 102  // 0.9025
}

one sig lmFuel_storable extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

one sig lmFuel_NA extends IMeasurable {}
{
  IMLEO = 0
  risk = 0    // 1
}

// Define the problem/model
one sig Apollo
{
  choices : set IMeasurable,
  totalIMLEO : one Int,
  totalRisk : one Int
}

// Calculate the attributes
fact { all a : Apollo | a.totalIMLEO = (sum c : a.choices | c.IMLEO) }
fact { all a : Apollo | a.totalRisk = (sum c : a.choices | c.risk) }

// Define the constraints
pred constraintSet
{
  // Must have 2 or 3 in cmCrew
  one ((cmCrew_2 + cmCrew_3) & Apollo.choices)

  // Must have 0, 1, 2, or 3 in lmCrew
  one ((lmCrew_0 + lmCrew_1 + lmCrew_2 + lmCrew_3) & Apollo.choices)

  // Must have direct or orbit in moonDeparture
  one ((moonDeparture_direct + moonDeparture_orbit) & Apollo.choices)

  // Must have direct or orbit in earthLaunch
  one ((earthLaunch_direct + earthLaunch_orbit) & Apollo.choices)

  // Must have direct or orbit in moonArrival
  one ((moonArrival_direct + moonArrival_orbit) & Apollo.choices)

  // Must have yes or no in EOR
  one ((eor_yes + eor_no) & Apollo.choices)

  // Must have yes or no in LOR
  one ((lor_yes + lor_no) & Apollo.choices)

  // Must have cryogenic or storable in smFuel
  one ((smFuel_cryogenic + smFuel_storable) & Apollo.choices)

  // Must have cryogenic, storable, or NA in lmFuel
  one ((lmFuel_cryogenic + lmFuel_storable + lmFuel_NA) & Apollo.choices)


  // lmFuelConstraint
  // Choose lmFuel_NA iff lor_no is chosen
  (lor_no in Apollo.choices) <=> (lmFuel_NA in Apollo.choices)

  // LORconstraint
  // If we want to have lor_yes, then we must choose moonArrival_orbit
  (lor_yes in Apollo.choices) => (moonArrival_orbit in Apollo.choices)

  // EORconstraint
  // If we want to have eor_yes, then we must choose earthLaunch_orbit
  (eor_yes in Apollo.choices) => (earthLaunch_orbit in Apollo.choices)

  // moonLeaving
  // If we want to have lor_yes, then we must choose moonDeparture_orbit
  (lor_yes in Apollo.choices) => (moonDeparture_orbit in Apollo.choices)

  // lmexists
  // Choose lor_no iff lmCrew_0
  (lor_no in Apollo.choices) <=> (lmCrew_0 in Apollo.choices)

  // lmcmcrew
  // Cannot have more lmCrew than cmCrew
  not ((lmCrew_3 in Apollo.choices) and (cmCrew_2 in Apollo.choices))
}

// Declare the Moolloy problem instance
inst config {
  10 Int,
  exactly 1 Apollo
}

// Set the objectives
objectives o_global  {
  minimize Apollo.totalRisk,
  minimize Apollo.totalIMLEO
}

run constraintSet for config optimize o_global
