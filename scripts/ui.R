library(shiny)

ui <- fluidPage(
  
  titlePanel("????"),
  
  sidebarLayout(
    
    #this widget controls the which type of data is shown
    #(GDP, electricity, etc.)
    sidebarPanel(
      selectInput("shape",
                  label = "Select data statistics",
                  choices = (datastats),
                  selected = datastats[1],
                  multiple = FALSE),
      
      #this widget controls the country selected
      selectInput("country", "Select a Country",
                   choices = countries,
                   selected=countries[1],
                   multiple = FALSE)
                   
      
    ),
    
    mainPanel(
      plotOutput("chart")
      #dataTableOutput("table") maybe ask if we want a data table?
    )
  )
)