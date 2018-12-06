For this project, we tried to determine which countries have the most
potential to grow and expand in the interest of telecommunication companies.

We used the dataset from this website:

We filtered out the data in order to get rid of empty columns.
Then, the data was filtered and ranked by using electricity consumption/production,
GDP per capita/GDP real growth rate, internet hosts/users, and telephone users (mobile vs landline).
This can be found in /scripts/startfuncs.R

We then used the filtered data to figure out the top 10 countries which potential
to grow. We then used that data to make a shiny app, as well as a file that
contains the data analysis (scripts/analysis.R).

shinyapps.io link: https://gracel54.shinyapps.io/scripts