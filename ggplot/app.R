#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

#ggplot
ui <- fluidPage(
    sliderInput(inputId = "num", label = "Choose a number", 
                value = 1, min = 1, max = 100), plotOutput("ggplot"))

server <- function(input,output){
    output$ggplot <- renderPlot({
        df <- data.frame(rnorm(input$num))
        ggplot(df, aes(x=rnorm(input$num))) + geom_histogram() + ggtitle("Ggplot Histogram of Input Data") + xlab("Input Number") + ylab("Count")
    })
}

shinyApp(ui = ui, server = server)