#!/usr/bin/env ruby

require 'pry'
require 'json'

def print_moolloy
  puts "open util/integer"
  puts "\n"

  puts "// Cost has been divided by 10 and rounded"
  puts "abstract sig Satellite {"
  puts "  Climate : one Int,"
  puts "  Cost : one Int,"
  puts "  Earth : one Int,"
  puts "  Eco : one Int,"
  puts "  Health : one Int,"
  puts "  Water : one Int,"
  puts "  Weather : one Int"
  puts "}"
  puts "\n"

  puts "// Define the different decision variables"
  puts "// These are the 17 satellites"
  puts "// Each satellite has up to 10 years, plus NA"
  print_vars
  puts "\n"

  puts "// Define the model"
  puts "one sig Decadal"
  puts "{"
  puts "  satellites : set Satellite,"
  puts "  totalClimate : one Int,"
  puts "  totalCost : one Int,"
  puts "  totalEarth : one Int,"
  puts "  totalEco : one Int,"
  puts "  totalHealth : one Int,"
  puts "  totalWater : one Int,"
  puts "  totalWeather : one Int"
  puts "}"
  puts "\n"

  puts "// Calculate the totals"
  puts "fact { all d : Decadal | d.totalClimate = (sum s : d.satellites | s.Climate) }"
  puts "fact { all d : Decadal | d.totalCost = (sum s : d.satellites | s.Cost) }"
  puts "fact { all d : Decadal | d.totalEarth = (sum s : d.satellites | s.Earth) }"
  puts "fact { all d : Decadal | d.totalEco = (sum s : d.satellites | s.Eco) }"
  puts "fact { all d : Decadal | d.totalHealth = (sum s : d.satellites | s.Health) }"
  puts "fact { all d : Decadal | d.totalWater = (sum s : d.satellites | s.Water) }"
  puts "fact { all d : Decadal | d.totalWeather = (sum s : d.satellites | s.Weather) }"
  puts "\n"

  puts "// Define the constraints"
  print_constraints
  puts "\n"

  puts "// Declare the Moolloy problem instance"
  puts "inst config {"
  puts "  12 Int,"
  puts "  exactly 1 Decadal"
  puts "}"
  puts "\n"

  puts "// Set the objectives"
  puts "objectives o_global {"
  puts "  maximize Decadal.totalClimate,"
  puts "  maximize Decadal.totalCost,"
  puts "  maximize Decadal.totalEarth,"
  puts "  maximize Decadal.totalEco,"
  puts "  maximize Decadal.totalHealth,"
  puts "  maximize Decadal.totalWater,"
  puts "  maximize Decadal.totalWeather"
  puts "}"
  puts "\n"

  puts "run constraintSet for config optimize o_global"
end

def print_vars
  $dvar.each do |satellite|
    name = satellite["name"]
    name = "ICESat_II" if name == "ICESat-II"
    name = "ThreeD_Winds" if name == "3D-Winds"
    name = "GEO_CAPE" if name == "GEO-CAPE"
    name = "GRACE_II" if name == "GRACE-II"

    mapping = satellite["functiontable"]["mapping"]

    years = []
    mapping.each{|m| years << m["dvalue"]}
    years.uniq!.sort!

    years = years - satellite["forbiddenvalue"] if !satellite["forbiddenvalue"].nil?

    years.each do |year|
      puts "one sig #{name}_#{year} extends Satellite {}"
      puts "{"

      year_metrics = mapping.select{|s| s["dvalue"] == year}.sort{|x,y| x["metric"] <=> y["metric"]}
      year_metrics.each do |ym|
        val = ym["fun"].to_i
        val = (val.to_f / 10.0).round if ym["metric"] == "Cost"
        puts "  #{ym["metric"]} = #{val}"
      end
      puts "}"
      puts "\n"
    end
  end
end

def print_constraints
  puts "pred constraintSet"
  puts "{"
  puts "  // Satellite can be launched in only one year, or not launched at all"
  puts "  one ((ICESat_II_2010 + ICESat_II_2011 + ICESat_II_2012 + ICESat_II_2013 + ICESat_II_2014 + ICESat_II_2015 + ICESat_II_2016 + ICESat_II_2017 + ICESat_II_2018 + ICESat_II_2019 + ICESat_II_NA) & Decadal.satellites)\n\n"

  puts "  one ((CLARREO_2010 + CLARREO_2011 + CLARREO_2012 + CLARREO_2013 + CLARREO_2014 + CLARREO_2015 + CLARREO_2016 + CLARREO_2017 + CLARREO_2018 + CLARREO_2019 + CLARREO_NA) & Decadal.satellites)\n\n"

  puts "  one ((SMAP_2012 + SMAP_2013 + SMAP_2014 + SMAP_2015 + SMAP_2016 + SMAP_2017 + SMAP_2018 + SMAP_2019 + SMAP_NA) & Decadal.satellites)\n\n"

  puts "  one ((ACE_2015 + ACE_2016 + ACE_2017 + ACE_2018 + ACE_2019 + ACE_NA) & Decadal.satellites)\n\n"

  puts "  one ((ASCENDS_2013 + ASCENDS_2014 + ASCENDS_2015 + ASCENDS_2016 + ASCENDS_NA) & Decadal.satellites)\n\n"

  puts "  one ((DESDynl_2010 + DESDynl_2011 + DESDynl_2012 + DESDynl_2013 + DESDynl_2014 + DESDynl_2015 + DESDynl_2016 + DESDynl_2017 + DESDynl_2018 + DESDynl_2019 + DESDynl_NA) & Decadal.satellites)\n\n"

  puts "  one ((GACM_2017 + GACM_2018 + GACM_2019 + GACM_NA) & Decadal.satellites)\n\n"

  puts "  one ((GEO_CAPE_2015 + GEO_CAPE_2016 + GEO_CAPE_2017 + GEO_CAPE_2018 + GEO_CAPE_2019 + GEO_CAPE_NA) & Decadal.satellites)\n\n"

  puts "  one ((GPSRO_2011 + GPSRO_2012 + GPSRO_NA) & Decadal.satellites)\n\n"

  puts "  one ((GRACE_II_2016 + GRACE_II_2017 + GRACE_II_2018 + GRACE_II_2019 + GRACE_II_NA) & Decadal.satellites)\n\n"

  puts "  one ((HyspIRI_2014 + HyspIRI_2015 + HyspIRI_2016 + HyspIRI_2017 + HyspIRI_2018 + HyspIRI_2019 + HyspIRI_NA) & Decadal.satellites)\n\n"

  puts "  one ((LIST_2017 + LIST_2018 + LIST_2019 + LIST_NA) & Decadal.satellites)\n\n"

  puts "  one ((PATH_2016 + PATH_2017 + PATH_2018 + PATH_2019 + PATH_NA) & Decadal.satellites)\n\n"

  puts "  one ((SCLP_2016 + SCLP_2017 + SCLP_2018 + SCLP_2019 + SCLP_NA) & Decadal.satellites)\n\n"

  puts "  one ((SWOT_2013 + SWOT_2014 + SWOT_2015 + SWOT_NA) & Decadal.satellites)\n\n"

  puts "  one ((ThreeD_Winds_2015 + ThreeD_Winds_2016 + ThreeD_Winds_2017 + ThreeD_Winds_2018 + ThreeD_Winds_2019 + ThreeD_Winds_NA) & Decadal.satellites)\n\n"

  puts "  one ((XOVWM_2013 + XOVWM_2014 + XOVWM_2015 + XOVWM_2016 + XOVWM_NA) & Decadal.satellites)\n\n"

  puts "\n"

  puts "  // Fix_Launch constraints"
  puts "  // These satellites must be launched in the specified years"
  puts "  CLARREO_2010 in Decadal.satellites"
  puts "  DESDynl_2010 in Decadal.satellites"
  puts "  ACE_2015 in Decadal.satellites"
  puts "  GACM_2017 in Decadal.satellites"
  puts "  ASCENDS_2013 in Decadal.satellites"
  puts "\n"

  puts "  // SWOT_before_XOVWM constraints"
  puts "  // If SWOT comes before XOVWM, then XOVWM cannot be more than 1 year after SWOT"
  puts "  // No constraint if XOVWM comes first"
  puts "  (SWOT_2013 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites)"
  puts "  (SWOT_2014 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites or XOVWM_2015 in Decadal.satellites)"
  puts "  (SWOT_2015 in Decadal.satellites) => (XOVWM_NA in Decadal.satellites or XOVWM_2013 in Decadal.satellites or XOVWM_2014 in Decadal.satellites or XOVWM_2015 in Decadal.satellites or XOVWM_2016 in Decadal.satellites)"
  puts "\n"

  puts "  // Budget constraints"

  puts "  // Fairness_Health constraints"

  puts "  // Fairness_Eco constraints"

  puts "  // Fairness_Water constraints"

  puts "  // Fairness_Earth constraints"

  puts "  // Fairness_Weather constraints"

  puts "  // Fairness_Climate constraints"
  puts "}"
end

file = File.open "decadal.json"
contents = file.read

model = JSON.parse contents
moolloy = model["moolloy"]

moolloy.delete "metric"
moolloy.delete "domain"

$dvar = moolloy["dvar"]
$constraint = moolloy["constraint"]

binding.pry
