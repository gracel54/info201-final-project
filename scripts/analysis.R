# Function that makes a list about the data and returns it
library(dplyr)

  
# Simple analysis of the filtered data, and Waheeda you could pick some useful for the reports.
# The yeet equal the filtered date of the 10 counries
#_-------------------------------------------------------------------------------------------------------------------
#(1) Number of the Country 
  num_country <- nrow(df)
  
#(2) Which country has the most Internet users 
  most_popular_country <- 
    yeet$Country[as.numeric(yeet$`Internet users`) == max(as.numeric(yeet$`Internet users`))]
  # Answer is USA
  
#(3) Which country has the most Internet hosts
  most_popular_country <- 
    yeet$Country[as.numeric(yeet$`Internet hosts`) == max(as.numeric(yeet$`Internet host`))]
  # Answer is USA

#(4) Which coutry has the most electricity surplus?
  elec_most_surplus <- yeet$Country[as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`) == 
                                             max(as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`))]
  # Answer is USA

# (5) Which country has the highest sum rank?
  most_sum_rank <- 
    yeet$Country[as.numeric(yeet$`sum_rank`) == min(as.numeric(yeet$`sum_rank`))]
  
  # Answer is USA

# (6) Which country has the highest net_ratio?
  most_net_ratio <- 
    yeet$Country[as.numeric(yeet$`net_ratio`) == max(as.numeric(yeet$`net_ratio`))]
  
  # Answer is USA

# (7) Which country has the highest GDP growth?
  most_gdp_growth<- 
    yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) == max(as.numeric(yeet$`GDP - real growth rate(%)`))]
  
  # Answer is "Uruguay"
# Overall, we could able to see the United # Among the countries, the united states was the leading countries in internet users, 
  # electricity consumption,and most category of the data.

  
# Here is analysis about the coutry has potential to have more investment from internt company in the future among this ten countries.
# Also, the analysis below would help ansnwer our major questiones below:
#Which country have relatively ok GDP levels but doesn't have much internet usage? (b),(i),(j)
#Which country relies on cell phone services but not as much on internets? (a)
#What are the top regions for communication-service companies to expand to? (c),(d),(e),(f),(g),(h)
    
#-------------------------------------------------------------------------------------------------------------------------------


#(a) Which country has ok mobile cellular (above average) but less internet users (below average)?
 ok_mc_poor_iusers <- yeet$Country[as.numeric(yeet$`Telephones - mobile cellular`) > mean(as.numeric(yeet$`Telephones - mobile cellular`)) 
                                           & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
  
  # The Answer is United Kingdom.

#(b) Which country has OK GDP growth(above average) but less Internet usage(below average)?
  okgdp_less_usage <- 
    yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                   & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
   # Answer is "Uruguay" and "Russia" 


#(c) Which country has OK electricity surplus(above average) but less phone ratio(below average)?
  ok_surplus_poor_phone_ratio <- yeet$Country[as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`) 
                                                    > mean(as.numeric(yeet$`Electricity - production(kWh)`) - as.numeric(yeet$`Electricity - consumption(kWh)`)) 
                                                    & as.numeric(yeet$phone_ratio) < mean(yeet$phone_ratio)]
  # The Answer is United States and Canada.

#(d)Which country has the worse internet user to internet hosts ratio(more users and less hosts)
# and make this country has more potenial for internet to expand.
  worse_iuser_ihost_ratio <-yeet$Country[as.numeric(yeet$`Internet users`)/as.numeric(yeet$`Internet hosts`) == 
                                                     max(as.numeric(yeet$`Internet users`)/as.numeric(yeet$`Internet hosts`))]
  
  
#(e) Which country has the good electric rank(above averge) as well as relative high economic growth (above averge), 
# make this country has more potenial for future internet company to invest.
  
  good_erank_good_gdp_growth <-  yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                                         & as.numeric(yeet$`ele_rank`) > mean(as.numeric(yeet$`ele_rank`))]
  
  # The Answer is "Uruguay".

 
#(f)Which country has the relative higher GDP per captia(above averge) but relative low phone_rank(below averge),
# and internet comapny would invest more to encourge individual to purchaes more phone in this country
  good_gdp_pc_poor_phone_rank <-  yeet$Country[as.numeric(yeet$`GDP - per capita`) > mean(as.numeric(yeet$`GDP - per capita`)) 
                                                     & as.numeric(yeet$`phone_rank`) < mean(as.numeric(yeet$`phone_rank`))]
  
  # The answer is "United States" and "Canada".
  

#(g)Which country has the relative higher GDP growth(above averge) and relative high sum_rank(above averge),
  # and internet comapny would invest more because of the high growth and high overal rank.
  good_gdp_growth_good_sum_rank <-  yeet$Country[as.numeric(yeet$`GDP - real growth rate(%)`) > mean(as.numeric(yeet$`GDP - real growth rate(%)`)) 
                                                      & as.numeric(yeet$`sum_rank`) > mean(as.numeric(yeet$`sum_rank`))]

  # The answer is "Russia"

#(h)Which country has the relative high Electricity consumption(above averge) but relative low phone rank(above averge),
  # and internet comapny would invest more because the high growth and high overal rank.
  good_gdp_pc_poor_phone_rank <-  yeet$Country[as.numeric(yeet$`Electricity - consumption(kWh)`) > mean(as.numeric(yeet$`Electricity - consumption(kWh)`)) 
                                                      & as.numeric(yeet$`phone_rank`) < mean(as.numeric(yeet$`phone_rank`))]
  
  
  # The answer is "United States" and "Russia"

#(i) Which country has ok gdp level (above average) but less internet users (below average)?
  ok_mc_poor_iusers <- yeet$Country[as.numeric(yeet$`gdp`) > mean(as.numeric(yeet$`gdp`)) 
                                           & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
  
  # The Answer is "Norway", "Uruguay" and "Australia"

  
 #(j) Which country has ok gdp rank level (above average) but less internet users (below average)?
  ok_mc_poor_iusers <- yeet$Country[as.numeric(yeet$`gdp_rank`) > mean(as.numeric(yeet$`gdp_rank`)) 
                                           & as.numeric(yeet$`Internet users`) < mean(as.numeric(yeet$`Internet users`))]
  
  # The Answer is "Canada", "Russia" and "Switzerland"

  
  

# More analysis:
# However, from markting standpoint,Russia and Uruguay are two countries has more potenial for a internet company to invest since the market are not quite full.
# UK,USA and Canada also are potenial expanding area because of their storng cell phone users'

