open util/integer

// Define the Feature signature
abstract sig Feature
{
  RampUpTime : one Int,
  cost : one Int
}

// Define the features
one sig LocationFinding extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig GPS extends Feature {}
{
  RampUpTime = 6
  cost = 80
}

one sig RadioTriangulation extends Feature {}
{
  RampUpTime = 8
  cost = 0
}

one sig HardwarePlatform extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig NexusOneHTC extends Feature {}
{
  RampUpTime = 0
  cost = 525
}

one sig DroidMotorola extends Feature {}
{
  RampUpTime = 0
  cost = 520
}

one sig FileSharing extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig FileManagerOpenIntents extends Feature {}
{
  RampUpTime = 9
  cost = 0
}

one sig InHouseFileManager extends Feature {}
{
  RampUpTime = 8
  cost = 0
}

one sig ReportSynchronization extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig ExplicitReportsSync extends Feature {}
{
  RampUpTime = 2
  cost = 0
}

one sig ImplicitReportsSync extends Feature {}
{
  RampUpTime = 2
  cost = 0
}

one sig ChatProtocol extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig OpenFire extends Feature {}
{
  RampUpTime = 6
  cost = 0
}

one sig InHouseChatProtocol extends Feature {}
{
  RampUpTime = 4
  cost = 0
}

one sig MapAccess extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig OnDemandGoogleSite extends Feature {}
{
  RampUpTime = 9
  cost = 0
}

one sig CachedGoogleServer extends Feature {}
{
  RampUpTime = 9
  cost = 900
}

one sig PreloadedEsri extends Feature {}
{
  RampUpTime = 13
  cost = 170
}

one sig Connectivity extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig WiFi extends Feature {}
{
  RampUpTime = 3
  cost = 80
}

one sig ThreeGNexusOne extends Feature {}
{
  RampUpTime = 2
  cost = 400
}

one sig ThreeDroid extends Feature {}
{
  RampUpTime = 2
  cost = 400
}

one sig Bluetooth extends Feature {}
{
  RampUpTime = 2
  cost = 70
}

one sig Database extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig MySQL extends Feature {}
{
  RampUpTime = 2
  cost = 0
}

one sig sqLite extends Feature {}
{
  RampUpTime = 4
  cost = 0
}

one sig ArchitecturalStyle extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig PeerToPeer extends Feature {}
{
  RampUpTime = 11
  cost = 0
}

one sig ClientServer extends Feature {}
{
  RampUpTime = 8
  cost = 0
}

one sig PushBased extends Feature {}
{
  RampUpTime = 10
  cost = 0
}

one sig DataExchangeFormat extends Feature {}
{
  RampUpTime = 0
  cost = 0
}

one sig Xml extends Feature {}
{
  RampUpTime = 3
  cost = 0
}

one sig CompressedXML extends Feature {}
{
  RampUpTime = 5
  cost = 0
}

one sig UnformattedData extends Feature {}
{
  RampUpTime = 2
  cost = 0
}

// Define SearchAndRescueFM
sig SearchAndRescueFM
{
  features : set Feature,
  total_cost : one Int,
  total_RampUpTime : one Int
}

// Sum up the metrics
fact { all s : SearchAndRescueFM | s.total_cost = (sum f : s.features | f.cost) }
fact { all s : SearchAndRescueFM | s.total_RampUpTime = (sum f : s.features | f.RampUpTime) }

// Define the predicates: what features must be included and their relationships
pred featureSet
{
  // All top-leve features are required
  LocationFinding in SearchAndRescueFM.features
  HardwarePlatform in SearchAndRescueFM.features
  FileSharing in SearchAndRescueFM.features
  ReportSynchronization in SearchAndRescueFM.features
  ChatProtocol in SearchAndRescueFM.features
  MapAccess in SearchAndRescueFM.features
  Connectivity in SearchAndRescueFM.features
  Database in SearchAndRescueFM.features
  ArchitecturalStyle in SearchAndRescueFM.features
  DataExchangeFormat in SearchAndRescueFM.features

  // Must select exactly one of GPS or RadioTriangulation
  one ((GPS + RadioTriangulation) & SearchAndRescueFM.features)

  // Must select exactly one of NexusOneHTC or DroidMotorola
  one ((NexusOneHTC + DroidMotorola) & SearchAndRescueFM.features)

  // Must select exactly one of FileManagerOpenIntents or InHouseFileManager
  one ((FileManagerOpenIntents + InHouseFileManager) & SearchAndRescueFM.features)

  // Must select exactly one of ExplicitReportsSync and ImplicitReportsSync
  one ((ExplicitReportsSync + ImplicitReportsSync) & SearchAndRescueFM.features)

  // Must select exactly one of OpenFire or InHouseChatProtocol
  one ((OpenFire + InHouseChatProtocol) & SearchAndRescueFM.features)

  // Must select exactly one of OnDemandGoogleSite, CachedGoogleServer, or PreloadedEsri
  one ((OnDemandGoogleSite + CachedGoogleServer + PreloadedEsri) & SearchAndRescueFM.features)

  // Must select exactly one of WiFi, ThreeGNexusOne, ThreeDroid, or Bluetooth
  one ((WiFi + ThreeGNexusOne + ThreeDroid + Bluetooth) & SearchAndRescueFM.features)

  // Must select exactly one of MySQL or sqLite
  one ((MySQL + sqLite) & SearchAndRescueFM.features)

  // Must select exactly one of PeerToPeer, ClientServer, or PushBased
  one ((PeerToPeer + ClientServer + PeerToPeer) & SearchAndRescueFM.features)

  // Must select exactly one of Xml, CompressedXML, or UnformattedData
  one ((Xml + CompressedXML + UnformattedData) & SearchAndRescueFM.features)
}

// Declare the Moolloy problem instance
inst config
{
  11 Int,
  exactly 1 SearchAndRescueFM
}

// Set the objective(s)
objectives o_global
{
  minimize SearchAndRescueFM.total_cost,
  minimize SearchAndRescueFM.total_RampUpTime
}

run featureSet for config optimize o_global

