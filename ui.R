library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Data Science"),

  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV file", multiple = FALSE, accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv"), width = NULL,
                buttonLabel = "Browse...", placeholder = "No file selected"),
      checkboxInput("header", "Header", TRUE),
      selectInput("headers", "File Headers", choices = c("Select..."))
    ),
  
    mainPanel(
      tabsetPanel(              
        tabPanel(title = "Data",
                 dataTableOutput("table")
        ),
        tabPanel(title = "Graphic",
                 plotOutput("char")
        ),
        tabPanel(title = "Summary",
                 verbatimTextOutput("summary", placeholder = FALSE)
        )
      )
    )
  )
))
