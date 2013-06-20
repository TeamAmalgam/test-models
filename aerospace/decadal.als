open util/integer

// Cost has been divided by 10 and rounded
abstract sig Satellite {
  Climate : one Int,
  Cost : one Int,
  Earth : one Int,
  Eco : one Int,
  Health : one Int,
  Water : one Int,
  Weather : one Int
}

// Define the different decision variables
// These are the 17 satellites
// Each satellite has up to 10 years, plus NA
one sig ICESat_II_2010 extends Satellite {}
{
  Climate = 56
  Cost = 30
  Earth = 0
  Eco = 36
  Health = 0
  Water = 29
  Weather = 0
}

one sig ICESat_II_2011 extends Satellite {}
{
  Climate = 47
  Cost = 30
  Earth = 0
  Eco = 32
  Health = 0
  Water = 26
  Weather = 0
}

one sig ICESat_II_2012 extends Satellite {}
{
  Climate = 40
  Cost = 30
  Earth = 0
  Eco = 29
  Health = 0
  Water = 24
  Weather = 0
}

one sig ICESat_II_2013 extends Satellite {}
{
  Climate = 34
  Cost = 30
  Earth = 0
  Eco = 26
  Health = 0
  Water = 21
  Weather = 0
}

one sig ICESat_II_2014 extends Satellite {}
{
  Climate = 29
  Cost = 30
  Earth = 0
  Eco = 23
  Health = 0
  Water = 19
  Weather = 0
}

one sig ICESat_II_2015 extends Satellite {}
{
  Climate = 25
  Cost = 30
  Earth = 0
  Eco = 21
  Health = 0
  Water = 17
  Weather = 0
}

one sig ICESat_II_2016 extends Satellite {}
{
  Climate = 21
  Cost = 30
  Earth = 0
  Eco = 19
  Health = 0
  Water = 16
  Weather = 0
}

one sig ICESat_II_2017 extends Satellite {}
{
  Climate = 18
  Cost = 30
  Earth = 0
  Eco = 17
  Health = 0
  Water = 14
  Weather = 0
}

one sig ICESat_II_2018 extends Satellite {}
{
  Climate = 15
  Cost = 30
  Earth = 0
  Eco = 15
  Health = 0
  Water = 13
  Weather = 0
}

one sig ICESat_II_2019 extends Satellite {}
{
  Climate = 13
  Cost = 30
  Earth = 0
  Eco = 14
  Health = 0
  Water = 11
  Weather = 0
}

one sig ICESat_II_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig CLARREO_2010 extends Satellite {}
{
  Climate = 56
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 10
  Water = 0
  Weather = 0
}

one sig CLARREO_2011 extends Satellite {}
{
  Climate = 47
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 9
  Water = 0
  Weather = 0
}

one sig CLARREO_2012 extends Satellite {}
{
  Climate = 40
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 8
  Water = 0
  Weather = 0
}

one sig CLARREO_2013 extends Satellite {}
{
  Climate = 34
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 8
  Water = 0
  Weather = 0
}

one sig CLARREO_2014 extends Satellite {}
{
  Climate = 29
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 7
  Water = 0
  Weather = 0
}

one sig CLARREO_2015 extends Satellite {}
{
  Climate = 25
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 6
  Water = 0
  Weather = 0
}

one sig CLARREO_2016 extends Satellite {}
{
  Climate = 21
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 5
  Water = 0
  Weather = 0
}

one sig CLARREO_2017 extends Satellite {}
{
  Climate = 18
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 5
  Water = 0
  Weather = 0
}

one sig CLARREO_2018 extends Satellite {}
{
  Climate = 15
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 4
  Water = 0
  Weather = 0
}

one sig CLARREO_2019 extends Satellite {}
{
  Climate = 13
  Cost = 27
  Earth = 0
  Eco = 0
  Health = 4
  Water = 0
  Weather = 0
}

one sig CLARREO_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig SMAP_2012 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 31
  Water = 58
  Weather = 0
}

one sig SMAP_2013 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 28
  Water = 53
  Weather = 0
}

one sig SMAP_2014 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 25
  Water = 47
  Weather = 0
}

one sig SMAP_2015 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 23
  Water = 43
  Weather = 0
}

one sig SMAP_2016 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 20
  Water = 38
  Weather = 0
}

one sig SMAP_2017 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 18
  Water = 34
  Weather = 0
}

one sig SMAP_2018 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 16
  Water = 31
  Weather = 0
}

one sig SMAP_2019 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 0
  Eco = 0
  Health = 15
  Water = 28
  Weather = 0
}

one sig SMAP_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig XOVWM_2013 extends Satellite {}
{
  Climate = 56
  Cost = 35
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig XOVWM_2014 extends Satellite {}
{
  Climate = 47
  Cost = 35
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig XOVWM_2015 extends Satellite {}
{
  Climate = 40
  Cost = 35
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig XOVWM_2016 extends Satellite {}
{
  Climate = 34
  Cost = 35
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig XOVWM_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig PATH_2016 extends Satellite {}
{
  Climate = 0
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 31
  Water = 29
  Weather = 27
}

one sig PATH_2017 extends Satellite {}
{
  Climate = 0
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 28
  Water = 26
  Weather = 25
}

one sig PATH_2018 extends Satellite {}
{
  Climate = 0
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 25
  Water = 24
  Weather = 22
}

one sig PATH_2019 extends Satellite {}
{
  Climate = 0
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 23
  Water = 21
  Weather = 20
}

one sig PATH_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig ThreeD_Winds_2015 extends Satellite {}
{
  Climate = 0
  Cost = 65
  Earth = 0
  Eco = 0
  Health = 0
  Water = 29
  Weather = 27
}

one sig ThreeD_Winds_2016 extends Satellite {}
{
  Climate = 0
  Cost = 65
  Earth = 0
  Eco = 0
  Health = 0
  Water = 26
  Weather = 25
}

one sig ThreeD_Winds_2017 extends Satellite {}
{
  Climate = 0
  Cost = 65
  Earth = 0
  Eco = 0
  Health = 0
  Water = 24
  Weather = 22
}

one sig ThreeD_Winds_2018 extends Satellite {}
{
  Climate = 0
  Cost = 65
  Earth = 0
  Eco = 0
  Health = 0
  Water = 21
  Weather = 20
}

one sig ThreeD_Winds_2019 extends Satellite {}
{
  Climate = 0
  Cost = 65
  Earth = 0
  Eco = 0
  Health = 0
  Water = 19
  Weather = 18
}

one sig ThreeD_Winds_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig SCLP_2016 extends Satellite {}
{
  Climate = 0
  Cost = 50
  Earth = 0
  Eco = 0
  Health = 0
  Water = 29
  Weather = 0
}

one sig SCLP_2017 extends Satellite {}
{
  Climate = 0
  Cost = 50
  Earth = 0
  Eco = 0
  Health = 0
  Water = 26
  Weather = 0
}

one sig SCLP_2018 extends Satellite {}
{
  Climate = 0
  Cost = 50
  Earth = 0
  Eco = 0
  Health = 0
  Water = 24
  Weather = 0
}

one sig SCLP_2019 extends Satellite {}
{
  Climate = 0
  Cost = 50
  Earth = 0
  Eco = 0
  Health = 0
  Water = 21
  Weather = 0
}

one sig SCLP_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig GACM_2017 extends Satellite {}
{
  Climate = 0
  Cost = 60
  Earth = 0
  Eco = 36
  Health = 31
  Water = 29
  Weather = 55
}

one sig GACM_2018 extends Satellite {}
{
  Climate = 0
  Cost = 60
  Earth = 0
  Eco = 32
  Health = 28
  Water = 26
  Weather = 49
}

one sig GACM_2019 extends Satellite {}
{
  Climate = 0
  Cost = 60
  Earth = 0
  Eco = 29
  Health = 25
  Water = 24
  Weather = 44
}

one sig GACM_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig GEO_CAPE_2015 extends Satellite {}
{
  Climate = 0
  Cost = 55
  Earth = 0
  Eco = 36
  Health = 52
  Water = 29
  Weather = 82
}

one sig GEO_CAPE_2016 extends Satellite {}
{
  Climate = 0
  Cost = 55
  Earth = 0
  Eco = 32
  Health = 47
  Water = 26
  Weather = 74
}

one sig GEO_CAPE_2017 extends Satellite {}
{
  Climate = 0
  Cost = 55
  Earth = 0
  Eco = 29
  Health = 42
  Water = 24
  Weather = 66
}

one sig GEO_CAPE_2018 extends Satellite {}
{
  Climate = 0
  Cost = 55
  Earth = 0
  Eco = 26
  Health = 38
  Water = 21
  Weather = 60
}

one sig GEO_CAPE_2019 extends Satellite {}
{
  Climate = 0
  Cost = 55
  Earth = 0
  Eco = 23
  Health = 34
  Water = 19
  Weather = 54
}

one sig GEO_CAPE_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig GRACE_II_2016 extends Satellite {}
{
  Climate = 56
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 0
  Water = 29
  Weather = 0
}

one sig GRACE_II_2017 extends Satellite {}
{
  Climate = 47
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 0
  Water = 26
  Weather = 0
}

one sig GRACE_II_2018 extends Satellite {}
{
  Climate = 40
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 0
  Water = 24
  Weather = 0
}

one sig GRACE_II_2019 extends Satellite {}
{
  Climate = 34
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 0
  Water = 21
  Weather = 0
}

one sig GRACE_II_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig SWOT_2013 extends Satellite {}
{
  Climate = 56
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 21
  Water = 29
  Weather = 0
}

one sig SWOT_2014 extends Satellite {}
{
  Climate = 47
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 19
  Water = 26
  Weather = 0
}

one sig SWOT_2015 extends Satellite {}
{
  Climate = 40
  Cost = 45
  Earth = 0
  Eco = 0
  Health = 17
  Water = 24
  Weather = 0
}

one sig SWOT_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig ASCENDS_2013 extends Satellite {}
{
  Climate = 0
  Cost = 40
  Earth = 10
  Eco = 36
  Health = 0
  Water = 0
  Weather = 0
}

one sig ASCENDS_2014 extends Satellite {}
{
  Climate = 0
  Cost = 40
  Earth = 9
  Eco = 32
  Health = 0
  Water = 0
  Weather = 0
}

one sig ASCENDS_2015 extends Satellite {}
{
  Climate = 0
  Cost = 40
  Earth = 8
  Eco = 29
  Health = 0
  Water = 0
  Weather = 0
}

one sig ASCENDS_2016 extends Satellite {}
{
  Climate = 0
  Cost = 40
  Earth = 8
  Eco = 26
  Health = 0
  Water = 0
  Weather = 0
}

one sig ASCENDS_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig HyspIRI_2014 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 67
  Eco = 36
  Health = 21
  Water = 0
  Weather = 0
}

one sig HyspIRI_2015 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 63
  Eco = 32
  Health = 19
  Water = 0
  Weather = 0
}

one sig HyspIRI_2016 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 60
  Eco = 29
  Health = 17
  Water = 0
  Weather = 0
}

one sig HyspIRI_2017 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 57
  Eco = 26
  Health = 15
  Water = 0
  Weather = 0
}

one sig HyspIRI_2018 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 54
  Eco = 23
  Health = 14
  Water = 0
  Weather = 0
}

one sig HyspIRI_2019 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 52
  Eco = 21
  Health = 12
  Water = 0
  Weather = 0
}

one sig HyspIRI_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig GPSRO_2011 extends Satellite {}
{
  Climate = 56
  Cost = 15
  Earth = 0
  Eco = 0
  Health = 10
  Water = 29
  Weather = 0
}

one sig GPSRO_2012 extends Satellite {}
{
  Climate = 47
  Cost = 15
  Earth = 0
  Eco = 0
  Health = 9
  Water = 26
  Weather = 0
}

one sig GPSRO_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig LIST_2017 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 67
  Eco = 0
  Health = 21
  Water = 0
  Weather = 0
}

one sig LIST_2018 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 63
  Eco = 0
  Health = 19
  Water = 0
  Weather = 0
}

one sig LIST_2019 extends Satellite {}
{
  Climate = 0
  Cost = 30
  Earth = 60
  Eco = 0
  Health = 17
  Water = 0
  Weather = 0
}

one sig LIST_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig ACE_2015 extends Satellite {}
{
  Climate = 111
  Cost = 80
  Earth = 0
  Eco = 36
  Health = 41
  Water = 0
  Weather = 82
}

one sig ACE_2016 extends Satellite {}
{
  Climate = 94
  Cost = 80
  Earth = 0
  Eco = 32
  Health = 37
  Water = 0
  Weather = 74
}

one sig ACE_2017 extends Satellite {}
{
  Climate = 80
  Cost = 80
  Earth = 0
  Eco = 29
  Health = 34
  Water = 0
  Weather = 66
}

one sig ACE_2018 extends Satellite {}
{
  Climate = 68
  Cost = 80
  Earth = 0
  Eco = 26
  Health = 30
  Water = 0
  Weather = 60
}

one sig ACE_2019 extends Satellite {}
{
  Climate = 58
  Cost = 80
  Earth = 0
  Eco = 23
  Health = 27
  Water = 0
  Weather = 54
}

one sig ACE_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

one sig DESDynl_2010 extends Satellite {}
{
  Climate = 56
  Cost = 70
  Earth = 67
  Eco = 36
  Health = 21
  Water = 29
  Weather = 0
}

one sig DESDynl_2011 extends Satellite {}
{
  Climate = 47
  Cost = 70
  Earth = 60
  Eco = 32
  Health = 19
  Water = 26
  Weather = 0
}

one sig DESDynl_2012 extends Satellite {}
{
  Climate = 40
  Cost = 70
  Earth = 54
  Eco = 29
  Health = 17
  Water = 24
  Weather = 0
}

one sig DESDynl_2013 extends Satellite {}
{
  Climate = 34
  Cost = 70
  Earth = 49
  Eco = 26
  Health = 15
  Water = 21
  Weather = 0
}

one sig DESDynl_2014 extends Satellite {}
{
  Climate = 29
  Cost = 70
  Earth = 44
  Eco = 23
  Health = 14
  Water = 19
  Weather = 0
}

one sig DESDynl_2015 extends Satellite {}
{
  Climate = 25
  Cost = 70
  Earth = 39
  Eco = 21
  Health = 12
  Water = 17
  Weather = 0
}

one sig DESDynl_2016 extends Satellite {}
{
  Climate = 21
  Cost = 70
  Earth = 35
  Eco = 19
  Health = 11
  Water = 16
  Weather = 0
}

one sig DESDynl_2017 extends Satellite {}
{
  Climate = 18
  Cost = 70
  Earth = 32
  Eco = 17
  Health = 10
  Water = 14
  Weather = 0
}

one sig DESDynl_2018 extends Satellite {}
{
  Climate = 15
  Cost = 70
  Earth = 29
  Eco = 15
  Health = 9
  Water = 13
  Weather = 0
}

one sig DESDynl_2019 extends Satellite {}
{
  Climate = 13
  Cost = 70
  Earth = 26
  Eco = 14
  Health = 8
  Water = 11
  Weather = 0
}

one sig DESDynl_NA extends Satellite {}
{
  Climate = 0
  Cost = 0
  Earth = 0
  Eco = 0
  Health = 0
  Water = 0
  Weather = 0
}

// Each year has a set of satellites and a total cost
abstract sig Year {
  satellites : set Satellite,
  totalCost : one Int,
  totalClimate : one Int,
  totalEarth : one Int,
  totalEco : one Int,
  totalHealth : one Int,
  totalWater : one Int,
  totalWeather : one Int
}

one sig Year2010 extends Year {} {}
one sig Year2011 extends Year {} {}
one sig Year2012 extends Year {} {}
one sig Year2013 extends Year {} {}
one sig Year2014 extends Year {} {}
one sig Year2015 extends Year {} {}
one sig Year2016 extends Year {} {}
one sig Year2017 extends Year {} {}
one sig Year2018 extends Year {} {}
one sig Year2019 extends Year {} {}

// Define the model
one sig Decadal
{
  satellites : set Satellite,
  totalCost : one Int,
  totalClimate : one Int,
  totalEarth : one Int,
  totalEco : one Int,
  totalHealth : one Int,
  totalWater : one Int,
  totalWeather : one Int
}

// Calculate the totals
fact { all d : Decadal | d.totalClimate = (sum s : d.satellites | s.Climate) }
fact { all d : Decadal | d.totalCost = (sum s : d.satellites | s.Cost) }
fact { all d : Decadal | d.totalEarth = (sum s : d.satellites | s.Earth) }
fact { all d : Decadal | d.totalEco = (sum s : d.satellites | s.Eco) }
fact { all d : Decadal | d.totalHealth = (sum s : d.satellites | s.Health) }
fact { all d : Decadal | d.totalWater = (sum s : d.satellites | s.Water) }
fact { all d : Decadal | d.totalWeather = (sum s : d.satellites | s.Weather) }

fact { all y : Year2010 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2011 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2012 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2013 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2014 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2015 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2016 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2017 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2018 | y.totalCost = (sum s : y.satellites | s.Cost) }
fact { all y : Year2019 | y.totalCost = (sum s : y.satellites | s.Cost) }

fact { all y : Year2010 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2011 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2012 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2013 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2014 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2015 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2016 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2017 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2018 | y.totalClimate = (sum s : y.satellites | s.Climate) }
fact { all y : Year2019 | y.totalClimate = (sum s : y.satellites | s.Climate) }

fact { all y : Year2010 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2011 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2012 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2013 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2014 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2015 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2016 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2017 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2018 | y.totalEarth = (sum s : y.satellites | s.Earth) }
fact { all y : Year2019 | y.totalEarth = (sum s : y.satellites | s.Earth) }

fact { all y : Year2010 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2011 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2012 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2013 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2014 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2015 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2016 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2017 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2018 | y.totalEco = (sum s : y.satellites | s.Eco) }
fact { all y : Year2019 | y.totalEco = (sum s : y.satellites | s.Eco) }

fact { all y : Year2010 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2011 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2012 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2013 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2014 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2015 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2016 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2017 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2018 | y.totalHealth = (sum s : y.satellites | s.Health) }
fact { all y : Year2019 | y.totalHealth = (sum s : y.satellites | s.Health) }

fact { all y : Year2010 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2011 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2012 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2013 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2014 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2015 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2016 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2017 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2018 | y.totalWater = (sum s : y.satellites | s.Water) }
fact { all y : Year2019 | y.totalWater = (sum s : y.satellites | s.Water) }

fact { all y : Year2010 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2011 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2012 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2013 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2014 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2015 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2016 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2017 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2018 | y.totalWeather = (sum s : y.satellites | s.Weather) }
fact { all y : Year2019 | y.totalWeather = (sum s : y.satellites | s.Weather) }


// Define the constraints
pred constraintSet
{
  // Satellite can be launched in only one year, or not launched at all
  one ((ICESat_II_2010 + ICESat_II_2011 + ICESat_II_2012 + ICESat_II_2013 + ICESat_II_2014 + ICESat_II_2015 + ICESat_II_2016 + ICESat_II_2017 + ICESat_II_2018 + ICESat_II_2019 + ICESat_II_NA) & Decadal.satellites)

  one ((CLARREO_2010 + CLARREO_2011 + CLARREO_2012 + CLARREO_2013 + CLARREO_2014 + CLARREO_2015 + CLARREO_2016 + CLARREO_2017 + CLARREO_2018 + CLARREO_2019 + CLARREO_NA) & Decadal.satellites)

  one ((SMAP_2012 + SMAP_2013 + SMAP_2014 + SMAP_2015 + SMAP_2016 + SMAP_2017 + SMAP_2018 + SMAP_2019 + SMAP_NA) & Decadal.satellites)

  one ((ACE_2015 + ACE_2016 + ACE_2017 + ACE_2018 + ACE_2019 + ACE_NA) & Decadal.satellites)

  one ((ASCENDS_2013 + ASCENDS_2014 + ASCENDS_2015 + ASCENDS_2016 + ASCENDS_NA) & Decadal.satellites)

  one ((DESDynl_2010 + DESDynl_2011 + DESDynl_2012 + DESDynl_2013 + DESDynl_2014 + DESDynl_2015 + DESDynl_2016 + DESDynl_2017 + DESDynl_2018 + DESDynl_2019 + DESDynl_NA) & Decadal.satellites)

  one ((GACM_2017 + GACM_2018 + GACM_2019 + GACM_NA) & Decadal.satellites)

  one ((GEO_CAPE_2015 + GEO_CAPE_2016 + GEO_CAPE_2017 + GEO_CAPE_2018 + GEO_CAPE_2019 + GEO_CAPE_NA) & Decadal.satellites)

  one ((GPSRO_2011 + GPSRO_2012 + GPSRO_NA) & Decadal.satellites)

  one ((GRACE_II_2016 + GRACE_II_2017 + GRACE_II_2018 + GRACE_II_2019 + GRACE_II_NA) & Decadal.satellites)

  one ((HyspIRI_2014 + HyspIRI_2015 + HyspIRI_2016 + HyspIRI_2017 + HyspIRI_2018 + HyspIRI_2019 + HyspIRI_NA) & Decadal.satellites)

  one ((LIST_2017 + LIST_2018 + LIST_2019 + LIST_NA) & Decadal.satellites)

  one ((PATH_2016 + PATH_2017 + PATH_2018 + PATH_2019 + PATH_NA) & Decadal.satellites)

  one ((SCLP_2016 + SCLP_2017 + SCLP_2018 + SCLP_2019 + SCLP_NA) & Decadal.satellites)

  one ((SWOT_2013 + SWOT_2014 + SWOT_2015 + SWOT_NA) & Decadal.satellites)

  one ((ThreeD_Winds_2015 + ThreeD_Winds_2016 + ThreeD_Winds_2017 + ThreeD_Winds_2018 + ThreeD_Winds_2019 + ThreeD_Winds_NA) & Decadal.satellites)

  one ((XOVWM_2013 + XOVWM_2014 + XOVWM_2015 + XOVWM_2016 + XOVWM_NA) & Decadal.satellites)


  // Put the satellites in their respective years
  (ICESat_II_2010 in Decadal.satellites) => (ICESat_II_2010 in Year2010.satellites)
  (ICESat_II_2011 in Decadal.satellites) => (ICESat_II_2011 in Year2011.satellites)
  (ICESat_II_2012 in Decadal.satellites) => (ICESat_II_2012 in Year2012.satellites)
  (ICESat_II_2013 in Decadal.satellites) => (ICESat_II_2013 in Year2013.satellites)
  (ICESat_II_2014 in Decadal.satellites) => (ICESat_II_2014 in Year2014.satellites)
  (ICESat_II_2015 in Decadal.satellites) => (ICESat_II_2015 in Year2015.satellites)
  (ICESat_II_2016 in Decadal.satellites) => (ICESat_II_2016 in Year2016.satellites)
  (ICESat_II_2017 in Decadal.satellites) => (ICESat_II_2017 in Year2017.satellites)
  (ICESat_II_2018 in Decadal.satellites) => (ICESat_II_2018 in Year2018.satellites)
  (ICESat_II_2019 in Decadal.satellites) => (ICESat_II_2019 in Year2019.satellites)
  (CLARREO_2010 in Decadal.satellites) => (CLARREO_2010 in Year2010.satellites)
  (CLARREO_2011 in Decadal.satellites) => (CLARREO_2011 in Year2011.satellites)
  (CLARREO_2012 in Decadal.satellites) => (CLARREO_2012 in Year2012.satellites)
  (CLARREO_2013 in Decadal.satellites) => (CLARREO_2013 in Year2013.satellites)
  (CLARREO_2014 in Decadal.satellites) => (CLARREO_2014 in Year2014.satellites)
  (CLARREO_2015 in Decadal.satellites) => (CLARREO_2015 in Year2015.satellites)
  (CLARREO_2016 in Decadal.satellites) => (CLARREO_2016 in Year2016.satellites)
  (CLARREO_2017 in Decadal.satellites) => (CLARREO_2017 in Year2017.satellites)
  (CLARREO_2018 in Decadal.satellites) => (CLARREO_2018 in Year2018.satellites)
  (CLARREO_2019 in Decadal.satellites) => (CLARREO_2019 in Year2019.satellites)
  (SMAP_2012 in Decadal.satellites) => (SMAP_2012 in Year2012.satellites)
  (SMAP_2013 in Decadal.satellites) => (SMAP_2013 in Year2013.satellites)
  (SMAP_2014 in Decadal.satellites) => (SMAP_2014 in Year2014.satellites)
  (SMAP_2015 in Decadal.satellites) => (SMAP_2015 in Year2015.satellites)
  (SMAP_2016 in Decadal.satellites) => (SMAP_2016 in Year2016.satellites)
  (SMAP_2017 in Decadal.satellites) => (SMAP_2017 in Year2017.satellites)
  (SMAP_2018 in Decadal.satellites) => (SMAP_2018 in Year2018.satellites)
  (SMAP_2019 in Decadal.satellites) => (SMAP_2019 in Year2019.satellites)
  (XOVWM_2013 in Decadal.satellites) => (XOVWM_2013 in Year2013.satellites)
  (XOVWM_2014 in Decadal.satellites) => (XOVWM_2014 in Year2014.satellites)
  (XOVWM_2015 in Decadal.satellites) => (XOVWM_2015 in Year2015.satellites)
  (XOVWM_2016 in Decadal.satellites) => (XOVWM_2016 in Year2016.satellites)
  (PATH_2016 in Decadal.satellites) => (PATH_2016 in Year2016.satellites)
  (PATH_2017 in Decadal.satellites) => (PATH_2017 in Year2017.satellites)
  (PATH_2018 in Decadal.satellites) => (PATH_2018 in Year2018.satellites)
  (PATH_2019 in Decadal.satellites) => (PATH_2019 in Year2019.satellites)
  (ThreeD_Winds_2015 in Decadal.satellites) => (ThreeD_Winds_2015 in Year2015.satellites)
  (ThreeD_Winds_2016 in Decadal.satellites) => (ThreeD_Winds_2016 in Year2016.satellites)
  (ThreeD_Winds_2017 in Decadal.satellites) => (ThreeD_Winds_2017 in Year2017.satellites)
  (ThreeD_Winds_2018 in Decadal.satellites) => (ThreeD_Winds_2018 in Year2018.satellites)
  (ThreeD_Winds_2019 in Decadal.satellites) => (ThreeD_Winds_2019 in Year2019.satellites)
  (SCLP_2016 in Decadal.satellites) => (SCLP_2016 in Year2016.satellites)
  (SCLP_2017 in Decadal.satellites) => (SCLP_2017 in Year2017.satellites)
  (SCLP_2018 in Decadal.satellites) => (SCLP_2018 in Year2018.satellites)
  (SCLP_2019 in Decadal.satellites) => (SCLP_2019 in Year2019.satellites)
  (GACM_2017 in Decadal.satellites) => (GACM_2017 in Year2017.satellites)
  (GACM_2018 in Decadal.satellites) => (GACM_2018 in Year2018.satellites)
  (GACM_2019 in Decadal.satellites) => (GACM_2019 in Year2019.satellites)
  (GEO_CAPE_2015 in Decadal.satellites) => (GEO_CAPE_2015 in Year2015.satellites)
  (GEO_CAPE_2016 in Decadal.satellites) => (GEO_CAPE_2016 in Year2016.satellites)
  (GEO_CAPE_2017 in Decadal.satellites) => (GEO_CAPE_2017 in Year2017.satellites)
  (GEO_CAPE_2018 in Decadal.satellites) => (GEO_CAPE_2018 in Year2018.satellites)
  (GEO_CAPE_2019 in Decadal.satellites) => (GEO_CAPE_2019 in Year2019.satellites)
  (GRACE_II_2016 in Decadal.satellites) => (GRACE_II_2016 in Year2016.satellites)
  (GRACE_II_2017 in Decadal.satellites) => (GRACE_II_2017 in Year2017.satellites)
  (GRACE_II_2018 in Decadal.satellites) => (GRACE_II_2018 in Year2018.satellites)
  (GRACE_II_2019 in Decadal.satellites) => (GRACE_II_2019 in Year2019.satellites)
  (SWOT_2013 in Decadal.satellites) => (SWOT_2013 in Year2013.satellites)
  (SWOT_2014 in Decadal.satellites) => (SWOT_2014 in Year2014.satellites)
  (SWOT_2015 in Decadal.satellites) => (SWOT_2015 in Year2015.satellites)
  (ASCENDS_2013 in Decadal.satellites) => (ASCENDS_2013 in Year2013.satellites)
  (ASCENDS_2014 in Decadal.satellites) => (ASCENDS_2014 in Year2014.satellites)
  (ASCENDS_2015 in Decadal.satellites) => (ASCENDS_2015 in Year2015.satellites)
  (ASCENDS_2016 in Decadal.satellites) => (ASCENDS_2016 in Year2016.satellites)
  (HyspIRI_2014 in Decadal.satellites) => (HyspIRI_2014 in Year2014.satellites)
  (HyspIRI_2015 in Decadal.satellites) => (HyspIRI_2015 in Year2015.satellites)
  (HyspIRI_2016 in Decadal.satellites) => (HyspIRI_2016 in Year2016.satellites)
  (HyspIRI_2017 in Decadal.satellites) => (HyspIRI_2017 in Year2017.satellites)
  (HyspIRI_2018 in Decadal.satellites) => (HyspIRI_2018 in Year2018.satellites)
  (HyspIRI_2019 in Decadal.satellites) => (HyspIRI_2019 in Year2019.satellites)
  (GPSRO_2011 in Decadal.satellites) => (GPSRO_2011 in Year2011.satellites)
  (GPSRO_2012 in Decadal.satellites) => (GPSRO_2012 in Year2012.satellites)
  (LIST_2017 in Decadal.satellites) => (LIST_2017 in Year2017.satellites)
  (LIST_2018 in Decadal.satellites) => (LIST_2018 in Year2018.satellites)
  (LIST_2019 in Decadal.satellites) => (LIST_2019 in Year2019.satellites)
  (ACE_2015 in Decadal.satellites) => (ACE_2015 in Year2015.satellites)
  (ACE_2016 in Decadal.satellites) => (ACE_2016 in Year2016.satellites)
  (ACE_2017 in Decadal.satellites) => (ACE_2017 in Year2017.satellites)
  (ACE_2018 in Decadal.satellites) => (ACE_2018 in Year2018.satellites)
  (ACE_2019 in Decadal.satellites) => (ACE_2019 in Year2019.satellites)
  (DESDynl_2010 in Decadal.satellites) => (DESDynl_2010 in Year2010.satellites)
  (DESDynl_2011 in Decadal.satellites) => (DESDynl_2011 in Year2011.satellites)
  (DESDynl_2012 in Decadal.satellites) => (DESDynl_2012 in Year2012.satellites)
  (DESDynl_2013 in Decadal.satellites) => (DESDynl_2013 in Year2013.satellites)
  (DESDynl_2014 in Decadal.satellites) => (DESDynl_2014 in Year2014.satellites)
  (DESDynl_2015 in Decadal.satellites) => (DESDynl_2015 in Year2015.satellites)
  (DESDynl_2016 in Decadal.satellites) => (DESDynl_2016 in Year2016.satellites)
  (DESDynl_2017 in Decadal.satellites) => (DESDynl_2017 in Year2017.satellites)
  (DESDynl_2018 in Decadal.satellites) => (DESDynl_2018 in Year2018.satellites)
  (DESDynl_2019 in Decadal.satellites) => (DESDynl_2019 in Year2019.satellites)

  // Fix_Launch constraints
  // These satellites must be launched in the specified years
  CLARREO_2010 in Decadal.satellites
  DESDynl_2010 in Decadal.satellites
  ACE_2015 in Decadal.satellites
  GACM_2017 in Decadal.satellites
  ASCENDS_2013 in Decadal.satellites


  // SWOT_before_XOVWM constraints
  // If SWOT comes before XOVWM, then XOVWM cannot be more than 1 year after SWOT
  // No constraint if XOVWM comes first
  (SWOT_2013 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites)
  (SWOT_2014 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites or XOVWM_2015 in Decadal.satellites)
  (SWOT_2015 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites or XOVWM_2015 in Decadal.satellites or XOVWM_2016 in Decadal.satellites)


  // Budget constraints
  // Budget is capped to 750 for each year
  Year2010.totalCost <= 750
  Year2011.totalCost <= 750
  Year2012.totalCost <= 750
  Year2013.totalCost <= 750
  Year2014.totalCost <= 750
  Year2015.totalCost <= 750
  Year2016.totalCost <= 750
  Year2017.totalCost <= 750
  Year2018.totalCost <= 750
  Year2019.totalCost <= 750


  // Fairness_Health constraints
  // The Health community gets value within every three-year rolling window
  (Year2010.totalHealth > 0) or (Year2011.totalHealth > 0) or (Year2012.totalHealth > 0)
  (Year2011.totalHealth > 0) or (Year2012.totalHealth > 0) or (Year2013.totalHealth > 0)
  (Year2012.totalHealth > 0) or (Year2013.totalHealth > 0) or (Year2014.totalHealth > 0)
  (Year2013.totalHealth > 0) or (Year2014.totalHealth > 0) or (Year2015.totalHealth > 0)
  (Year2014.totalHealth > 0) or (Year2015.totalHealth > 0) or (Year2016.totalHealth > 0)
  (Year2015.totalHealth > 0) or (Year2016.totalHealth > 0) or (Year2017.totalHealth > 0)
  (Year2016.totalHealth > 0) or (Year2017.totalHealth > 0) or (Year2018.totalHealth > 0)
  (Year2017.totalHealth > 0) or (Year2018.totalHealth > 0) or (Year2019.totalHealth > 0)


  // Fairness_Eco constraints
  // The Eco community gets value within every three-year rolling window
  (Year2010.totalEco > 0) or (Year2011.totalEco > 0) or (Year2012.totalEco > 0)
  (Year2011.totalEco > 0) or (Year2012.totalEco > 0) or (Year2013.totalEco > 0)
  (Year2012.totalEco > 0) or (Year2013.totalEco > 0) or (Year2014.totalEco > 0)
  (Year2013.totalEco > 0) or (Year2014.totalEco > 0) or (Year2015.totalEco > 0)
  (Year2014.totalEco > 0) or (Year2015.totalEco > 0) or (Year2016.totalEco > 0)
  (Year2015.totalEco > 0) or (Year2016.totalEco > 0) or (Year2017.totalEco > 0)
  (Year2016.totalEco > 0) or (Year2017.totalEco > 0) or (Year2018.totalEco > 0)
  (Year2017.totalEco > 0) or (Year2018.totalEco > 0) or (Year2019.totalEco > 0)

  // Fairness_Water constraints
  // The Water community gets value within every three-year rolling window
  (Year2010.totalWater > 0) or (Year2011.totalWater > 0) or (Year2012.totalWater > 0)
  (Year2011.totalWater > 0) or (Year2012.totalWater > 0) or (Year2013.totalWater > 0)
  (Year2012.totalWater > 0) or (Year2013.totalWater > 0) or (Year2014.totalWater > 0)
  (Year2013.totalWater > 0) or (Year2014.totalWater > 0) or (Year2015.totalWater > 0)
  (Year2014.totalWater > 0) or (Year2015.totalWater > 0) or (Year2016.totalWater > 0)
  (Year2015.totalWater > 0) or (Year2016.totalWater > 0) or (Year2017.totalWater > 0)
  (Year2016.totalWater > 0) or (Year2017.totalWater > 0) or (Year2018.totalWater > 0)
  (Year2017.totalWater > 0) or (Year2018.totalWater > 0) or (Year2019.totalWater > 0)

  // Fairness_Earth constraints
  // The Earth community gets value within every three-year rolling window
  (Year2010.totalEarth > 0) or (Year2011.totalEarth > 0) or (Year2012.totalEarth > 0)
  (Year2011.totalEarth > 0) or (Year2012.totalEarth > 0) or (Year2013.totalEarth > 0)
  (Year2012.totalEarth > 0) or (Year2013.totalEarth > 0) or (Year2014.totalEarth > 0)
  (Year2013.totalEarth > 0) or (Year2014.totalEarth > 0) or (Year2015.totalEarth > 0)
  (Year2014.totalEarth > 0) or (Year2015.totalEarth > 0) or (Year2016.totalEarth > 0)
  (Year2015.totalEarth > 0) or (Year2016.totalEarth > 0) or (Year2017.totalEarth > 0)
  (Year2016.totalEarth > 0) or (Year2017.totalEarth > 0) or (Year2018.totalEarth > 0)
  (Year2017.totalEarth > 0) or (Year2018.totalEarth > 0) or (Year2019.totalEarth > 0)

  // Fairness_Weather constraints
  // The Weather community gets value within every three-year rolling window
  (Year2010.totalWeather > 0) or (Year2011.totalWeather > 0) or (Year2012.totalWeather > 0)
  (Year2011.totalWeather > 0) or (Year2012.totalWeather > 0) or (Year2013.totalWeather > 0)
  (Year2012.totalWeather > 0) or (Year2013.totalWeather > 0) or (Year2014.totalWeather > 0)
  (Year2013.totalWeather > 0) or (Year2014.totalWeather > 0) or (Year2015.totalWeather > 0)
  (Year2014.totalWeather > 0) or (Year2015.totalWeather > 0) or (Year2016.totalWeather > 0)
  (Year2015.totalWeather > 0) or (Year2016.totalWeather > 0) or (Year2017.totalWeather > 0)
  (Year2016.totalWeather > 0) or (Year2017.totalWeather > 0) or (Year2018.totalWeather > 0)
  (Year2017.totalWeather > 0) or (Year2018.totalWeather > 0) or (Year2019.totalWeather > 0)

  // Fairness_Climate constraints
  // The Climate community gets value within every three-year rolling window
  (Year2010.totalClimate > 0) or (Year2011.totalClimate > 0) or (Year2012.totalClimate > 0)
  (Year2011.totalClimate > 0) or (Year2012.totalClimate > 0) or (Year2013.totalClimate > 0)
  (Year2012.totalClimate > 0) or (Year2013.totalClimate > 0) or (Year2014.totalClimate > 0)
  (Year2013.totalClimate > 0) or (Year2014.totalClimate > 0) or (Year2015.totalClimate > 0)
  (Year2014.totalClimate > 0) or (Year2015.totalClimate > 0) or (Year2016.totalClimate > 0)
  (Year2015.totalClimate > 0) or (Year2016.totalClimate > 0) or (Year2017.totalClimate > 0)
  (Year2016.totalClimate > 0) or (Year2017.totalClimate > 0) or (Year2018.totalClimate > 0)
  (Year2017.totalClimate > 0) or (Year2018.totalClimate > 0) or (Year2019.totalClimate > 0)
}

// Declare the Moolloy problem instance
inst config {
  12 Int,
  exactly 1 Decadal
}

// Set the objectives
objectives o_global {
  maximize Decadal.totalCost,
  maximize Decadal.totalClimate,
  maximize Decadal.totalEarth,
  maximize Decadal.totalEco,
  maximize Decadal.totalHealth,
  maximize Decadal.totalWater,
  maximize Decadal.totalWeather
}

run constraintSet for config optimize o_global
