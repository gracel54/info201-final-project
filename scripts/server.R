library(shiny)
library(ggplot2)

source("./analysis.R")


server <- function(input, output){

  
  #generates a map showing UFO sightings filtered by shape type, 
  #along with a summary of the sighting
  output$chart <- renderPlot({
    #ggplot(data, aes(input$datastats)) + geom_bar()
    
  })
  
  
  

}