open util/integer

// Define the IMeasurable (attribute) signature
// Risk = -1000 * ln(value)
abstract sig IMeasurable {
  risk : one Int
}

// Define the different decision variables and choices
// Decision vars are EOR, LOR, EarthLaunch, MoonArrival, MoonDeparture,
// CMCrew, LMCrew, SMFuel, and LMFuel

// Command module crew
one sig cmCrew_2 extends IMeasurable {}
{
  risk = 0    // 1
}

one sig cmCrew_3 extends IMeasurable {}
{
  risk = 0    // 1
}

// Lunar module crew
one sig lmCrew_0 extends IMeasurable {}
{
  risk = 0    // 1
}

one sig lmCrew_1 extends IMeasurable {}
{
  risk = 105  // 0.9
}

one sig lmCrew_2 extends IMeasurable {}
{
  risk = 0    // 1
}

one sig lmCrew_3 extends IMeasurable {}
{
  risk = 0    // 1
}

one sig moonDeparture_orbit extends IMeasurable {}
{
  risk = 105  // 0.9
}

one sig moonDeparture_direct extends IMeasurable {}
{
  risk = 105  // 0.9
}

one sig earthLaunch_orbit extends IMeasurable {}
{
  risk = 10   // 0.99
}

one sig earthLaunch_direct extends IMeasurable {}
{
  risk = 105  // 0.9
}

one sig moonArrival_orbit extends IMeasurable {}
{
  risk = 10   // 0.99
}

one sig moonArrival_direct extends IMeasurable {}
{
  risk = 51   // 0.95
}

// Earth Orbit Rendezvous
one sig eor_yes extends IMeasurable {}
{
  risk = 51   // 0.95
}

one sig eor_no extends IMeasurable {}
{
  risk = 20   // 0.98
}

// Lunar Orbit Rendezvous
one sig lor_yes extends IMeasurable {}
{
  risk = 51   // 0.95
}

one sig lor_no extends IMeasurable {}
{
  risk = 0    // 1
}

// Service Module fuel
one sig smFuel_cryogenic extends IMeasurable {}
{
}
// Custom metric value for smFuel_cryogenic.risk
// Note that risk values have been converted: Risk = -1000 * ln(value)
fact { (lor_yes in Apollo.choices) => (smFuel_cryogenic.risk = 102) else (smFuel_cryogenic.risk = 205) }
	/**
	 * This function returns the risk if smFuel is cryogenic
	 * 	if(LOR == yes) then mult = 2.0;
	 * 	else mult = 4.0;
	 * 	return math.pow(0.95, mult);
	 */

one sig smFuel_storable extends IMeasurable {}
{
  risk = 0    // 1
}

// Lunar Module fuel
one sig lmFuel_cryogenic extends IMeasurable {}
{
  risk = 102  // 0.9025
}

one sig lmFuel_storable extends IMeasurable {}
{
  risk = 0    // 1
}

one sig lmFuel_NA extends IMeasurable {}
{
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
fact { all a : Apollo | a.totalRisk = (sum c : a.choices | c.risk) }

// IMLEO: Initial Mass in Low-Earth Orbit
// Calculate totalIMLEO
// We can do it here instead of summing attributes, since the val is 0 for everything else
// These were precomputed in GenerateValsForIMLEO.java, see that file for the equations
// Yes, we are literally enumerating out every single possible value for totalIMLEO
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 21}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 21}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 12}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 12}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 22}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 22}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 12}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 12}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 22}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 22}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 13}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 13}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 23}
fact { (lor_no in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 23}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 15}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 15}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 29}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 29}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 16}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 16}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 17}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 17}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 17}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 17}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_no in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 30}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 4}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 4}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 4}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 4}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 7}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 8}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 8}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 8}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 9}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 9}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_2 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 13}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 5}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 5}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 6}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_0 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 6}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 8}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_1 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 9}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 11}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_2 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 13}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 10}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 13}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic in Apollo.choices) => Apollo.totalIMLEO = 12}
fact { (lor_yes in Apollo.choices and cmCrew_3 in Apollo.choices and lmCrew_3 in Apollo.choices and smFuel_cryogenic not in Apollo.choices and smFuel_cryogenic not in Apollo.choices) => Apollo.totalIMLEO = 15}

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
