function(input, output) {
  output$cours <- renderPrint({input$coursha})
  output$nb <- renderPrint({input$nbre})
  output$achat <- renderPrint({input$nbre*input$coursha*1.01587})
  output$rslt <- renderPrint({(input$nbre*input$coursvte*0.98413)-(input$nbre*input$coursha*1.01587)})
}
