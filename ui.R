library(shiny)

# Define UI for shiny application
shinyUI(pageWithSidebar(

# Application title
headerPanel("Tracker using dummy firm data"),

sidebarPanel(
  selectInput("firmName", "Filter by firm:", 
            choices = c("All",as.character(unique(testData$firm)))),

selectInput("dateRange", "Filter by Date Range:", 
            choices = c("All",
                        "Last Month", 
                        "Last Quarter",
                        "Last Year")),
checkboxGroupInput('show_vars', 'Columns in Data to show:',
                   names(testData), selected = names(testData))
),

mainPanel(
  h3(textOutput("caption")),
  plotOutput("plot"),
  dataTableOutput('subset'))
))

