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

#Import csv file with scores calculated
I1 <- read.csv("Calculated-Scores.csv", header = TRUE,row.names = 1)

#Set up interactive interface
ui <- fluidPage(
  titlePanel("Student Midterm Scores by Subject"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("show_subjects", "Pick Topics to See Students Number Correct per Subject:", names(I1),selected = NA)
    ),
    mainPanel(
      DT::dataTableOutput("scores")
    )
  )
)

server <- function(input, output) {
  output$scores <- DT::renderDataTable({
    DT::datatable(I1[, input$show_subjects, drop = FALSE])
  },include.rownames=TRUE)
}

shinyApp(ui = ui, server = server)