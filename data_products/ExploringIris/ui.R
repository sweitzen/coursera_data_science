#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that explores the iris dataset with plotly
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Exploring Iris with Plotly"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h6(paste0(
                "Select the variables from the Iris dataset you wish to see ",
                "plotted, the size of the plot, and then click 'Generate ",
                "Plot'."
            )),
            h6("You can also rotate the plot with your mouse."),
            h6("This Shiny app is verified to work in Chrome."),
            selectInput(
                "xaxis",
                "X-axis",
                names(iris)[1:4],
                names(iris)[1]
            ),
            selectInput(
                "yaxis",
                "Y-axis",
                names(iris)[1:4],
                names(iris)[2]
            ),
            selectInput(
                "zaxis",
                "Z-axis",
                names(iris)[1:4],
                names(iris)[3]
            ),
            sliderInput(
                "plotSize",
                "Plot Size",
                min=400,
                max=1000,
                value=500
            ),
            submitButton("Generate Plot")
        ),
        
        # Show plot
        mainPanel(
           plotlyOutput("plot")
        )
    )
))
