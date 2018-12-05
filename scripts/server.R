library(shiny)
library(ggplot2)
source("./startfuncs.R")

dataset <- get_10_countries()
datastats <- colnames(dataset)
countries <- dataset$Country

server <- function(input, output){
  
  #generates a bar chart showing the selected data statistic
  output$stat_select <- renderPlot({
    desired_stat <- input$datastats
    stat_list <- as.list(dataset[desired_stat])
    ggplot(data = dataset, aes(x = dataset$Country, 
                               y = as.numeric(unlist(stat_list)), fill = Country)) + 
      geom_col() + labs(x = "Country", y = desired_stat) +
      coord_flip()
  })
  
  output$country_select <- renderDataTable({
    dataset <- dataset %>%
      filter(Country == input$country | Country == input$country2)
  })
  

}