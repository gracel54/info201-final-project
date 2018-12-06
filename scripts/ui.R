library(shiny)
source("./startfuncs.R")
source("./analysis.R")

dataset <- get_10_countries()
datastats <- colnames(dataset)
countries <- dataset$Country

ui <- fluidPage(
  
  titlePanel("Telecommunications Expansion"),
  
  tabsetPanel(
    tabPanel("Plot", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
               
                 #select column of data to look at
                 selectInput("datastats",
                            label = "Select data statistics",
                            choices = datastats,
                            selected = datastats[2],
                            multiple = FALSE),
                 
                 #this widget controls the first country selected
                 selectInput("compare1", "Select a Country",
                             choices = countries,
                             selected = countries[1],
                             multiple = FALSE),
                 
                 #this widget controls the second country selected
                 selectInput("compare2", "Select a Country",
                             choices = countries,
                             selected = countries[2],
                             multiple = FALSE)),
               
               mainPanel(
                 plotOutput("stat_select")
               )
             )
    ),
    
    tabPanel("Table", fluid = TRUE,
             sidebarLayout(
               sidebarPanel( 
                 
                 #this widget controls the first country selected
                 selectInput("country", "Select a Country",
                             choices = countries,
                             selected = countries[1],
                             multiple = FALSE),
                 
                 #this widget controls the second country selected, 
                 #to be compared to the first country
                 selectInput("country2", "Select a Country",
                             choices = countries,
                             selected = countries[2],
                             multiple = FALSE)),
               
               mainPanel(
                 dataTableOutput("country_table")
               )
             )
    ),
    
    tabPanel("Overview", fluid = FALSE,
               mainPanel(width = 1000,
                 
                 h1("Purpose"),
                 p("The purpose of this project was to see where telecommunications companies should expand."),
                 p("The questions we wanted to answer were:"),
                 p("- What are the top regions for communication-service companies to expand their service?"),
                 p("- Which regions have relatively ok GDP levels but don't have much internet usage"),
                 p("- Which countries rely on cell phone service but not as much on internet?"),
                 p("Our targeted audiences are internet companies, telecommunication companies, 
                   video game companies, streaming services and any related businesses who are looking to expand globally."),
                 br(),
                 
                
                  h1("About the data"),
                 p("We worked with the Countries dataset .csv file found", 
                   a("here:", href =  "https://perso.telecom-paristech.fr/eagan/class/igr204/datasets")),
                 "This is a website that provides multidimensional datasets for study and research uses."),
                 br(),
                  
             
                 
                 
                 h1("Created by"),
                 p("Grace Lee, Yuji Lai, Waheeda Hakim, and Ting Shen"),
                 br(),
             
                 h1("Analysis"),
                p("We found out that", okgdp_less_usage[1], 
                    "is the country with an ok GDP and less usage so there is a good chance for internet companies to invest.",
               
               "Countries like", ok_surplus_poor_phone_ratio[1],"that have ok surplus but poor phone ratio are a good bit for communication 
               services companies to invest in and develop their business.",
               
               "There is also", ok_mc_poor_iusers[1], "that has good number of phone users but less internet users therefore",
               ok_mc_poor_iusers, "also has the potential to host more internet companies to invest.",
               
               
               "Additionally,", good_gdp_growth_good_sum_rank, "has the good GDP growth rate and sum rank which means companies
               can predict a good economic future based on the data we found.")
             
             
             
                 
               )
             )
    )


