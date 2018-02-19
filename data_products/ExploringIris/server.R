#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to plot iris data
shinyServer(function(input, output) {
   
  output$plot <- renderPlotly({
    
    # draw the plot with the specified variables
    plot_ly(x=iris[, match(input$xaxis, names(iris))], 
            y=iris[, match(input$yaxis, names(iris))], 
            z=iris[, match(input$zaxis, names(iris))],
            color=iris$Species,
            marker = list(size = 2)) %>%
    layout(title="Iris data: 3D Chart",
           scene=list(
               xaxis=list(title=input$xaxis),
               yaxis=list(title=input$yaxis),
               zaxis=list(title=input$zaxis)
           ),
           autosize=FALSE,
           width=input$plotSize,
           height=input$plotSize
    )
  })
  
})
