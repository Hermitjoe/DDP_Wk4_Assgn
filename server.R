library(shiny)

shinyServer(function(input, output) {
    data <- reactive({iris[sample(nrow(iris), input$s_NumOfPts ) , c(input$xAxis, input$yAxis)]}) # Random Selection from Iris for Columns selected
    
    output$plot1 <- renderPlot({                                                                  # Create PLot
        plot(data())                                                                              # Plot the data pulled
        
        if(input$ib_RL) {                                                                         # If Regression line requested
            model <- lm(get(input$yAxis) ~ get(input$xAxis), data=data())                         # Create Model Based on Y by X
            abline(model)                                                                         # Apply line to model
        }
    })
})