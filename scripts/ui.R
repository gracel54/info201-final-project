library(shiny)
source("./startfuncs.R")

dataset <- get_10_countries()
datastats <- colnames(dataset)
countries <- dataset$Country

ui <- fluidPage(
  
  titlePanel("Telecommunications Expansion"),
  
  tabsetPanel(
    tabPanel("Plot", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(selectInput("datastats",
                                        label = "Select data statistics",
                                        choices = datastats,
                                        selected = datastats[2],
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
                             selected= countries[1],
                             multiple = FALSE),
                 
                 #this widget controls the second country selected, 
                 #to be compared to the first country
                 selectInput("country2", "Select a Country",
                             choices = countries,
                             selected= countries[2],
                             multiple = FALSE)),
               
               mainPanel(
                 tabPanel("Table", dataTableOutput("country_select"))
               )
             )
    )
  )
)