library(shiny)
library(ggplot2)
source("./startfuncs.R")


dataset <- get_10_countries()
datastats <- colnames(dataset)
countries <- dataset$Country

server <- function(input, output){
    
  #generates a bar chart showing the selected data statistic
  output$stat_select <- renderPlot({
    
    #filtering out the dataset so that is only returns the selected countries
    #from the select input
    filter_country <- dataset %>%
      filter(Country == input$compare1 | Country == input$compare2)
    
    #creating a list that has the data statistics from the given countries
    desired_stat <- input$datastats
    stat_list <- as.list(filter_country[desired_stat])
    
    #generates a bar chart showing the two countries and the selected statistic
    ggplot(data = filter_country, aes(x = filter_country$Country, 
                               y = as.numeric(unlist(stat_list)), fill = Country)) + 
      geom_col() + labs(x = "Country", y = desired_stat) +
      coord_flip()
  })
  
  #renders a data table based on the countries selected
  output$country_table <- renderDataTable({
    dataset <- dataset %>%
      filter(Country == input$country)
  })

  
  

}
