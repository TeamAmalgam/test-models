open util/integer

// Define the Feature signature
abstract sig Feature
{
  RampUpTime : one Int,
  cost : one Int,
  DevelopmentTime : one Int,
  DeploymentTime : one Int
}

// Define the features
one sig LocationFinding extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig GPS extends Feature {}
{
  RampUpTime = 6
  cost = 80
  DevelopmentTime = 4
  DeploymentTime = 3
}

one sig RadioTriangulation extends Feature {}
{
  RampUpTime = 8
  cost = 0
  DevelopmentTime = 14
  DeploymentTime = 1
}

one sig HardwarePlatform extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig NexusOneHTC extends Feature {}
{
  RampUpTime = 0
  cost = 525
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig DroidMotorola extends Feature {}
{
  RampUpTime = 0
  cost = 520
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig FileSharing extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig FileManagerOpenIntents extends Feature {}
{
  RampUpTime = 9
  cost = 0
  DevelopmentTime = 4
  DeploymentTime = 1
}

one sig InHouseFileManager extends Feature {}
{
  RampUpTime = 8
  cost = 0
  DevelopmentTime = 6
  DeploymentTime = 0
}

one sig ReportSynchronization extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig ExplicitReportsSync extends Feature {}
{
  RampUpTime = 2
  cost = 0
  DevelopmentTime = 6
  DeploymentTime = 2
}

one sig ImplicitReportsSync extends Feature {}
{
  RampUpTime = 2
  cost = 0
  DevelopmentTime = 4
  DeploymentTime = 1
}

one sig ChatProtocol extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig OpenFire extends Feature {}
{
  RampUpTime = 6
  cost = 0
  DevelopmentTime = 6
  DeploymentTime = 1
}

one sig InHouseChatProtocol extends Feature {}
{
  RampUpTime = 4
  cost = 0
  DevelopmentTime = 8
  DeploymentTime = 0
}

one sig MapAccess extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig OnDemandGoogleSite extends Feature {}
{
  RampUpTime = 9
  cost = 0
  DevelopmentTime = 18
  DeploymentTime = 0
}

one sig CachedGoogleServer extends Feature {}
{
  RampUpTime = 9
  cost = 900
  DevelopmentTime = 18
  DeploymentTime = 4
}

one sig PreloadedEsri extends Feature {}
{
  RampUpTime = 13
  cost = 170
  DevelopmentTime = 27
  DeploymentTime = 4
}

one sig Connectivity extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig WiFi extends Feature {}
{
  RampUpTime = 3
  cost = 80
  DevelopmentTime = 0
  DeploymentTime = 6
}

one sig ThreeGNexusOne extends Feature {}
{
  RampUpTime = 2
  cost = 400
  DevelopmentTime = 0
  DeploymentTime = 3
}

one sig ThreeDroid extends Feature {}
{
  RampUpTime = 2
  cost = 400
  DevelopmentTime = 0
  DeploymentTime = 3
}

one sig Bluetooth extends Feature {}
{
  RampUpTime = 2
  cost = 70
  DevelopmentTime = 0
  DeploymentTime = 5
}

one sig Database extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig MySQL extends Feature {}
{
  RampUpTime = 2
  cost = 0
  DevelopmentTime = 17
  DeploymentTime = 15
}

one sig sqLite extends Feature {}
{
  RampUpTime = 4
  cost = 0
  DevelopmentTime = 16
  DeploymentTime = 14
}

one sig ArchitecturalStyle extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig PeerToPeer extends Feature {}
{
  RampUpTime = 11
  cost = 0
  DevelopmentTime = 26
  DeploymentTime = 18
}

one sig ClientServer extends Feature {}
{
  RampUpTime = 8
  cost = 0
  DevelopmentTime = 16
  DeploymentTime = 9
}

one sig PushBased extends Feature {}
{
  RampUpTime = 10
  cost = 0
  DevelopmentTime = 24
  DeploymentTime = 9
}

one sig DataExchangeFormat extends Feature {}
{
  RampUpTime = 0
  cost = 0
  DevelopmentTime = 0
  DeploymentTime = 0
}

one sig Xml extends Feature {}
{
  RampUpTime = 3
  cost = 0
  DevelopmentTime = 7
  DeploymentTime = 0
}

one sig CompressedXML extends Feature {}
{
  RampUpTime = 5
  cost = 0
  DevelopmentTime = 9
  DeploymentTime = 0
}

one sig UnformattedData extends Feature {}
{
  RampUpTime = 2
  cost = 0
  DevelopmentTime = 4
  DeploymentTime = 0
}

// Define SearchAndRescueFM
one sig SearchAndRescueFM
{
  features : set Feature,
  total_cost : one Int,
  total_RampUpTime : one Int,
  total_DevelopmentTime : one Int,
  total_DeploymentTime : one Int
}

// Sum up the metrics
fact { SearchAndRescueFM.total_cost = (sum f : SearchAndRescueFM.features | f.cost) }
fact { SearchAndRescueFM.total_RampUpTime = (sum f : SearchAndRescueFM.features | f.RampUpTime) }
fact { SearchAndRescueFM.total_DevelopmentTime = (sum f : SearchAndRescueFM.features | f.DevelopmentTime) }
fact { SearchAndRescueFM.total_DeploymentTime = (sum f : SearchAndRescueFM.features | f.DeploymentTime) }

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
  minimize SearchAndRescueFM.total_RampUpTime,
  minimize SearchAndRescueFM.total_DevelopmentTime,
  minimize SearchAndRescueFM.total_DeploymentTime
}

run featureSet for config optimize o_global

