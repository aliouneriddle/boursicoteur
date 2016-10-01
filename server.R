function(input, output) {
  output$text <- renderText({paste0("You are viewing tab \"", input$tabs, "\"")})
  output$cours <- renderPrint({input$coursha})
  output$nego <- renderPrint(1 + (input$taf*input$btaf)+ input$neg)
  output$achat <- renderPrint({input$nbre*input$coursha*1.01587})
  output$pl <- renderPlot({plot(rnorm(input$coursha),type="b")})
}
