# Function that makes a list about the data and returns it
library(dplyr)
out_list <- function(df) {
  output <- list()
  
# Simple analysis of the data, and your could pick some of it.
#_-------------------------------------------------------------------------------------------------------------------
#(1) Number of the Country 
  output$num_country <- nrow(df)
  
#(2) Which country has the most Internet users 
  output$most_popular_country <- 
    yeet$Country[as.numeric(yeet$`Internet users`) == max(as.numeric(yeet$`Internet users`))]
  # Answer is USA
  
#(3) Which country has the most Internet hosts
  output$most_popular_country <- 
    yeet$Country[as.numeric(yeet$`Internet hosts`) == max(as.numeric(yeet$`Internet host`))]
  # Answer is USA

#(4) Which coutry has the most electricity surplus?
  output$elec_most_surplus <- yeet$Country[as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`) == 
                                             max(as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`))]
  # Answer is USA

# (5) Which country has the highest sum rank?
  output$most_sum_rank <- 
    yeet$Country[as.numeric(yeet$`sum_rank`) == min(as.numeric(yeet$`sum_rank`))]
  
  # Answer is USA

# (6) Which country has the highest net_ratio?
  output$most_net_ratio <- 
    yeet$Country[as.numeric(yeet$`net_ratio`) == max(as.numeric(yeet$`net_ratio`))]
  
  # Answer is USA

# (7) Which country has the highest GDP growth?
  output$most_gdp_growth<- 
    yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) == max(as.numeric(yeet$`GDP - real growth rate(%)`))]
  
  # Answer is "Uruguay"


# Here is some analysis about the coutry has potential to have more investment from internt company in the future.
#-------------------------------------------------------------------------------------------------------------------------------

#(1) Which country has OK GDP growth(above average) but less Internet usage(below average)?
  output$okgdp_less_usage <- 
    yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                   & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
   # Answer is "Uruguay" and "Russia" 



# (2) Which country has OK electricity surplus(above average) as well as less phone ratio(below average)?
  output$ok_surplus_poor_phone_ratio <- yeet$Country[as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`) 
                                                    > mean(as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`)) 
                                                    & as.numeric(yeet$phone_ratio) < mean(yeet$phone_ratio)]
  # The Answer is United States and Canada.

#(3) Which country has ok mobile cellular (above average) but less internet users (below average)?
  output$ok_mc_poor_iusers <- yeet$Country[as.numeric(yeet$`Telephones - mobile cellular`) > mean(as.numeric(yeet$`Telephones - mobile cellular`)) 
                 & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
 
  # The Answer is United Kingdom.

#(4)Which country has the worse internet user to internet hosts ratio(more users and less hosts)
# and make this country has more potenial for internet to expand.
  output$worse_iuser_ihost_ratio <-yeet$Country[as.numeric(yeet$`Internet users`)/as.numeric(yeet$`Internet hosts`) == 
                                                     max(as.numeric(yeet$`Internet users`)/as.numeric(yeet$`Internet hosts`))]
  
  
#(5) Which country has the good electric rank(above averge) as well as relative high economic growth (above averge), 
# make this country has more potenial for future internet company to invest.
  
  output$good_erank_good_gdp_growth <-  yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                                         & as.numeric(yeet$`ele_rank`) > mean(as.numeric(yeet$`ele_rank`))]
  
  # The Answer is "Uruguay".

 
#(6)Which country has the relative higher GDP per captia(above averge) but relative low phone_rank(below averge),
# and internet comapny would invest more to encourge individual to purchaes more phone in this country
  output$good_gdp_pc_poor_phone_rank <-  yeet$Country[as.numeric(yeet$`GDP - per capita`) > mean(as.numeric(yeet$`GDP - per capita`)) 
                                                     & as.numeric(yeet$`phone_rank`) < mean(as.numeric(yeet$`phone_rank`))]
  
  # The answer is "United States" and "Canada".
  

#(7)Which country has the relative higher GDP growth(above averge) but relative high sum_rank(above averge),
  # and internet comapny would invest more because the high growth and high overal rank.
  output$good_gdp_growth_good_sum_rank <-  yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                                                      & as.numeric(yeet$`sum_rank`) > mean(as.numeric(yeet$`sum_rank`))]

  # The answer is "Russia"

#(8)Which country has the relative high Electricity consumption(above averge) but relative low phone rank(above averge),
  # and internet comapny would invest more because the high growth and high overal rank.
  output$good_gdp_pc_poor_phone_rank <-  yeet$Country[as.numeric(yeet$`Electricity - consumption(kWh)`) > mean(as.numeric(yeet$`Electricity - consumption(kWh)`)) 
                                                      & as.numeric(yeet$`phone_rank`) < mean(as.numeric(yeet$`phone_rank`))]
  
  
  # The answer is "United States" and "Russia"

}

# More analysis:
# Among the counries, the united state has the was the leading countries in internet users, electricity consumption,etc
# However, from markting standpoint,Russia and Uruguay are two countries has more potenial for a internet company to invest since the market are not quite full.
# UK,USA and Canada also are potenial expanding area because of their storng cell phone users as well wealther individuals.
