library(shiny)
shinyServer(function(input,output,session){
  
  var <- reactive({
    switch (input$dataset,
      "iris" = names(iris),
      "mtcars" = names(mtcars),
      "esoph" = names(esoph),
      "rock" = names(rock),
      "attitude" = names(attitude),
      "Sales" = names(Sales)
    )
  })
  
  output$vx <- renderUI({
    selectInput(inputId = "variable",label = "Select the response variable",
                choices = var(),selected = var()[1])
  })
  
  observeEvent(input$analysis, 
              {
    attach(get(input$dataset))
    
     model <- lm(as.formula(paste(input$variable, "~.")), data = get(input$dataset))
    
     output$data <- renderDataTable({
       
       head(get(input$dataset), n = 200)
       
     })
     
     output$form <- renderText({
       paste("model=", "lm(", input$variable, "~.", "data=", input$dataset, ")")
     })
    
    output$modelSummary <- renderPrint({
      
      summary(model)
    })
      
      output$plot <- renderPlot({
        
        par(mfrow=c(2,2))
        
        plot(model)
      })
    output$bestmodel <- renderPrint({
      step(model) 
    })
    })
    
  })
  