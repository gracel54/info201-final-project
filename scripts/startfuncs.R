library(dplyr)
library(data.table)

raw_data <- data.table::fread("countries.csv")

## select only columns we are interested in, and delete all the blank data
## "data" is now data table of 9columns: country, e cons + pro, gdp per cap + growth, internet hosts + users, telephone line + cellular
data <- raw_data %>% 
  filter(Country != "String") %>% 
  select(Country, `Electricity - consumption(kWh)`, `Electricity - production(kWh)`, `GDP - per capita`, `GDP - real growth rate(%)`, `Internet hosts`, `Internet users`, `Telephones - main lines in use`, `Telephones - mobile cellular`) %>% 
  filter(`Electricity - consumption(kWh)` != "") %>% 
  filter(`Electricity - production(kWh)` != "") %>% 
  filter(`GDP - per capita` != "") %>% 
  filter(`GDP - real growth rate(%)` != "") %>% 
  filter(`Internet hosts` != "") %>% 
  filter(`Internet users` != "") %>% 
  filter(`Telephones - main lines in use` != "") %>% 
  filter(`Telephones - mobile cellular` != "")

## here we rank the countries based on multiple aspects
data <- data %>% 
  mutate(elec_gap = as.numeric(as.character(`Electricity - production(kWh)`))- as.numeric(as.character(`Electricity - consumption(kWh)`))) %>% 
  arrange(desc(elec_gap)) %>% 
  mutate(ele_rank = 1:nrow(data)) %>% ## ele_rank: rank from highest [electrivity production - consumption] downwards
  
  mutate(gdp = as.numeric(as.character(`GDP - per capita`)) * as.numeric(as.character(`GDP - real growth rate(%)`))) %>% 
  arrange(desc(gdp)) %>% 
  mutate(gdp_rank = 1:nrow(data)) %>% ## gdp_rank: rank from highest gdp per cap * growth rate downwards

  mutate(net_ratio = as.numeric(as.character(`Internet hosts`)) / as.numeric(as.character(`Internet users`))) %>% 
  arrange(desc(net_ratio)) %>% 
  mutate(net_rank = 1:nrow(data)) %>% ## net_rank: rank from highest internet host per user downwards
  
  mutate(phone_ratio = as.numeric(as.character(`Telephones - mobile cellular`)) / as.numeric(as.character(`Telephones - main lines in use`))) %>% 
  arrange(phone_ratio) %>% 
  mutate(phone_rank = 1:nrow(data)) ## phone_rank: rank from lowest cellular phone usage compare to mainline upwards
  


## this function is what you call in future documents, after sourcing this file. 
## calling this will give you 10 rows of data, with first 9 columns same with ^ in data's comments,
## -- but added elec_gap, elec_rank, gdp, gdp_rank, net_ratio, net_rank, phone_ratio and phone_rank.
## they are arranged in the order(from top to bottom) with most possibility of growth to least possibility of growth
get_10_countries <- function(){
  result_data <- data %>% 
    mutate(sum_rank = ele_rank + gdp_rank + net_rank + phone_rank) %>% 
    arrange(sum_rank) %>% 
    head(10)
  result_data
}
