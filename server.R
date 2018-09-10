library(shiny)

shinyServer(function(input, output, session) {
  
  data <- reactive({
    if (is.null(input$file))
      return(NULL)
    readCsv()  
  })
  
  readCsv <- function() {
    df = read.csv(input$file$datapath, header = input$header)
    updateSelectInput(session = session, inputId = "headers", choices = names(df))
    return (df)
  }
  
  output$table <- renderDataTable(data())
  
  output$char <- renderPlot({
    df = data()[,c(input$headers)]
    barplot(table(df), col = rainbow(length(unique(df))))
  })
  
  output$summary <- renderText({ summary(data()) })
  
})