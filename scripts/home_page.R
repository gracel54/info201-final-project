library("shiny")
source("./analysis.R")


our_mission <- paste("Our targeted audiences are internet companies, telecommunication companies, video game companies,
streaming services and any related businesses who are looking to expand globally.")

result <- paste("We found out that",okgdp_less_usage, "is the country with an ok GDP and less usage so there is a good chance
      for internet companies to invest.",
               
 "countries like", ok_surplus_poor_phone_ratio,"that have ok surplus but poor phone ratio are a good bit for communication 
      services companies to invest in and develope their business.",
 
"There is also", ok_mc_poor_iusers, "that has good number of phone useres but less internet useres therefore",
      ok_mc_poor_iusers, "also has the potential to host more internet companies to invest.",


"Aditionally,", good_gdp_growth_good_sum_rank, "has the good GDP growth rate and sum rank which means companies
      can predict a good economic future based on the data we found.")

