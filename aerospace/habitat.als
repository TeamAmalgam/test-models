open util/integer

// Define the IMeasurable (attribute) signature
abstract sig IMeasurable {
  performance : one Int,
  risk : one Int
}

// Define the different decision variables and choices
// Decision variables are AgentType, SurfaceMobility, InfrastructureCC,
// ISRU, RelayTech, CommDataC, HabElement, GLAtoHabElems, MultHabModules,
// AnytimeReturn, SepLogisticsFromEarth, Dedicated_cargo_flights, CrewType,
// ModeOfMission, OutpostRegion, ContainerType, RealTimeCoverage,
// OutpostPower, MobilityPower, Outposts

one sig AgentType_crew extends IMeasurable {}
{
  performance = 1
  risk = 2
}

one sig AgentType_crew_robots extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig SurfaceMobility_none extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig SurfaceMobility_unpress_rover extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig SurfaceMobility_press_rover extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig SurfaceMobility_press_rover_sust_ops extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig InfrastructureCC_none extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig InfrastructureCC_offloading_only extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig InfrastructureCC_offloading_transporting extends IMeasurable {}
{
  performance = 3
  risk = 2
}

one sig InfrastructureCC_transporting_assembling extends IMeasurable {}
{
  performance = 2
  risk = 3
}

one sig InfrastructureCC_offloading_transporting_assembling extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig ISRU_no_ISRU extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig ISRU_produce_consumables extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig ISRU_produce_consume_propellants extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig RelayTech_none extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig RelayTech_lunar_surface extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig RelayTech_lunar_orbit extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig RelayTech_both extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig CommDataC_telemetry_video extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig CommDataC_interactive extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig HabElement_airlock_sized extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig HabElement_rover_sized extends IMeasurable {}
{
  performance = 2
  risk = 3
}

one sig HabElement_module_sized extends IMeasurable {}
{
  performance = 2
  risk = 3
}

one sig GLAtoHabElems_yes extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig GLAtoHabElems_no extends IMeasurable {}
{
  performance = 1
  risk = 2
}

one sig GLAtoHabElems_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig MultHabModules_yes extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig MultHabModules_no extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig MultHabModules_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig AnytimeReturn_yes extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig AnytimeReturn_no extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig AnytimeReturn_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig SepLogisticsFromEarth_yes extends IMeasurable {}
{
  performance = 3
  risk = 2
}

one sig SepLogisticsFromEarth_no extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig Dedicated_cargo_flights_yes extends IMeasurable {}
{
  performance = 3
  risk = 2
}

one sig Dedicated_cargo_flights_no extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig CrewType_sorties extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig CrewType_ext_sorties extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig CrewType_long_duration extends IMeasurable {}
{
  performance = 3
  risk = 2
}

one sig CrewType_con_presence extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig ModeOfMission_LOR extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig ModeOfMission_direct extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig OutpostRegions_polar extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig OutpostRegions_equatorial extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig OutpostRegions_both extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig OutpostRegions_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig ContainerType_small extends IMeasurable {}
{
  performance = 1
  risk = 2
}

one sig ContainerType_large extends IMeasurable {}
{
  performance = 1
  risk = 3
}

one sig ContainerType_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig RealTimeCoverage_outpost_only extends IMeasurable {}
{
  performance = 1
  risk = 1
}

one sig RealTimeCoverage_nearside_polar extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig RealTimeCoverage_global extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig OutpostPower_solar_storage extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig OutpostPower_dynamicRTG_solar extends IMeasurable {}
{
  performance = 2
  risk = 2
}

one sig OutpostPower_fission_initial_solar extends IMeasurable {}
{
  performance = 2
  risk = 3
}

one sig OutpostPower_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig MobilityPower_storage_only extends IMeasurable {}
{
  performance = 2
  risk = 1
}

one sig MobilityPower_solar_storage extends IMeasurable {}
{
  performance = 3
  risk = 2
}

one sig MobilityPower_dynamicRTG_storage extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig MobilityPower_dynamicRTG_solar_storage extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig MobilityPower_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

one sig Outposts_single extends IMeasurable {}
{
  performance = 2
  risk = 3
}

one sig Outposts_multiple extends IMeasurable {}
{
  performance = 3
  risk = 3
}

one sig Outposts_na extends IMeasurable {}
{
  performance = 0
  risk = 0
}

// Define the problem/model
one sig Habitat
{
  choices : set IMeasurable,
  totalPerformance : one Int,
  totalRisk : one Int
}

// Calculate the attributes
fact { all h : Habitat | h.totalPerformance = (sum c : h.choices | c.performance) }
fact { all h : Habitat | h.totalRisk = (sum c : h.choices | c.risk) }

// Define the constraints
pred constraintSet
{
  // Must have AgentType
  one ((AgentType_crew + AgentType_crew_robots) & Habitat.choices)

  // Must have SurfaceMobility
  one ((SurfaceMobility_none + SurfaceMobility_unpress_rover + SurfaceMobility_press_rover + SurfaceMobility_press_rover_sust_ops) & Habitat.choices)

  // Must have InfrastructureCC
  one ((InfrastructureCC_none + InfrastructureCC_offloading_only + InfrastructureCC_offloading_transporting + InfrastructureCC_transporting_assembling + InfrastructureCC_offloading_transporting_assembling) & Habitat.choices)

  // Must have ISRU
  one ((ISRU_no_ISRU + ISRU_produce_consumables + ISRU_produce_consume_propellants) & Habitat.choices)

  // Must have RelayTech
  one ((RelayTech_none + RelayTech_lunar_surface + RelayTech_lunar_orbit + RelayTech_both) & Habitat.choices)

  // Must have CommDataC
  one ((CommDataC_telemetry_video + CommDataC_interactive) & Habitat.choices)

  // Must have HabElement
  one ((HabElement_airlock_sized + HabElement_rover_sized + HabElement_module_sized) & Habitat.choices)

  // Must have GLAtoHabElems
  one ((GLAtoHabElems_yes + GLAtoHabElems_no + GLAtoHabElems_na) & Habitat.choices)

  // Must have MultHabModules
  one ((MultHabModules_yes + MultHabModules_no + MultHabModules_na) & Habitat.choices)

  // Must have AnytimeReturn
  one ((AnytimeReturn_yes + AnytimeReturn_no + AnytimeReturn_na) & Habitat.choices)

  // Must have SepLogisticsFromEarth
  one ((SepLogisticsFromEarth_yes + SepLogisticsFromEarth_no) & Habitat.choices)

  // Must have Dedicated_cargo_flights
  one ((Dedicated_cargo_flights_yes + Dedicated_cargo_flights_no) & Habitat.choices)

  // Must have CrewType
  one ((CrewType_sorties + CrewType_ext_sorties + CrewType_long_duration + CrewType_con_presence) & Habitat.choices)

  // Must have ModeOfMission
  one ((ModeOfMission_LOR + ModeOfMission_direct) & Habitat.choices)

  // Must have OutpostRegion
  one ((OutpostRegions_polar + OutpostRegions_equatorial + OutpostRegions_both + OutpostRegions_na) & Habitat.choices)

  // Must have ContainerType
  one ((ContainerType_small + ContainerType_large + ContainerType_na) & Habitat.choices)

  // Must have RealTimeCoverage
  one ((RealTimeCoverage_outpost_only + RealTimeCoverage_nearside_polar + RealTimeCoverage_global) & Habitat.choices)

  // Must have OutpostPower
  one ((OutpostPower_solar_storage + OutpostPower_dynamicRTG_solar + OutpostPower_fission_initial_solar + OutpostPower_na) & Habitat.choices)

  // Must have MobilityPower
  one ((MobilityPower_storage_only + MobilityPower_solar_storage + MobilityPower_dynamicRTG_storage + MobilityPower_dynamicRTG_solar_storage + MobilityPower_na) & Habitat.choices)

  // Must have Outposts
  one ((Outposts_single + Outposts_multiple + Outposts_na) & Habitat.choices)


  // AssembleMultipleParts
  ((MultHabModules_yes not in Habitat.choices) or (ContainerType_large not in Habitat.choices)) => ((InfrastructureCC_transporting_assembling not in Habitat.choices) and (InfrastructureCC_transporting_assembling not in Habitat.choices))

  // Constraint1
  (CrewType_sorties not in Habitat.choices) => (Dedicated_cargo_flights_yes in Habitat.choices)

  // Constraint2a
  (CrewType_con_presence in Habitat.choices) => (Outposts_single in Habitat.choices)

  // Constraint2b
  (CrewType_long_duration in Habitat.choices) => ((Outposts_single in Habitat.choices) or (Outposts_multiple in Habitat.choices))

  // Constraint2c
  ((CrewType_sorties in Habitat.choices) or (CrewType_ext_sorties in Habitat.choices)) => (Outposts_na in Habitat.choices)

  // Constraint3a
  (CrewType_con_presence in Habitat.choices) => (OutpostRegions_polar in Habitat.choices)

  // Constraint3b
  ((CrewType_long_duration in Habitat.choices) and (Outposts_single in Habitat.choices)) => ((OutpostRegions_polar in Habitat.choices) or (OutpostRegions_equatorial in Habitat.choices))

  // Constraint3c
  (Outposts_multiple in Habitat.choices) => (OutpostRegions_na not in Habitat.choices)

  // Constraint3d
  (Outposts_na in Habitat.choices) => (OutpostRegions_na in Habitat.choices)

  // Constraint4a
  (CrewType_sorties in Habitat.choices) => (HabElement_airlock_sized in Habitat.choices)

  // Constraint4b
  (CrewType_ext_sorties in Habitat.choices) => (HabElement_rover_sized in Habitat.choices)

  // Constraint4c
  ((CrewType_long_duration in Habitat.choices) or (CrewType_con_presence in Habitat.choices)) => (HabElement_module_sized in Habitat.choices)

  // Constraint5a
  (HabElement_module_sized not in Habitat.choices) => (MultHabModules_na in Habitat.choices)

  // Constraint5b
  ((HabElement_module_sized in Habitat.choices) and (CrewType_long_duration in Habitat.choices)) => (MultHabModules_no in Habitat.choices)

  // Constraint5c
  ((HabElement_module_sized in Habitat.choices) and (CrewType_con_presence in Habitat.choices)) => (MultHabModules_yes in Habitat.choices)

  // Constraint6
  (GLAtoHabElems_yes in Habitat.choices) => ((InfrastructureCC_none not in Habitat.choices) or (InfrastructureCC_transporting_assembling not in Habitat.choices))

  // Constraint7
  (Dedicated_cargo_flights_no in Habitat.choices) => ((SurfaceMobility_none in Habitat.choices) or (SurfaceMobility_unpress_rover in Habitat.choices))

  // Constraint8
  (SurfaceMobility_press_rover_sust_ops in Habitat.choices) => (HabElement_module_sized in Habitat.choices)

  // Constraint9
  (SurfaceMobility_none in Habitat.choices) => (MobilityPower_na in Habitat.choices)

  // Constraint10
  ((CrewType_long_duration not in Habitat.choices) or (CrewType_con_presence in Habitat.choices)) => (OutpostPower_na in Habitat.choices)

  // Constraint11
  (SepLogisticsFromEarth_yes in Habitat.choices) => (ContainerType_na not in Habitat.choices)

  // Constraint12
  (Dedicated_cargo_flights_no in Habitat.choices) => (ISRU_no_ISRU in Habitat.choices)

  // Constraint13
  (Dedicated_cargo_flights_no in Habitat.choices) => (ISRU_no_ISRU in Habitat.choices)

  // Constraint14
  (HabElement_module_sized not in Habitat.choices)
  (ContainerType_large not in Habitat.choices) => (InfrastructureCC_none in Habitat.choices)

  // Constraint15
  (SurfaceMobility_press_rover_sust_ops in Habitat.choices) => ((InfrastructureCC_none not in Habitat.choices) or (InfrastructureCC_offloading_only in Habitat.choices))

  // Constraint16
  (Outposts_multiple in Habitat.choices) => (RealTimeCoverage_outpost_only not in Habitat.choices)

  // Constraint17
  (RealTimeCoverage_outpost_only not in Habitat.choices) => (RelayTech_none not in Habitat.choices)

  // Constraint18
  AnytimeReturn_yes in Habitat.choices

  // Constraint19
  ModeOfMission_LOR in Habitat.choices
}

// Declare the Moolloy problem instance
inst config {
  6 Int,
  exactly 1 Habitat
}

// Set the objectives
objectives o_global  {
  maximize Habitat.totalPerformance,
  maximize Habitat.totalRisk
}

run constraintSet for config optimize o_global
