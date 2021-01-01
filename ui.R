library(shiny)

shinyUI(fluidPage(
    titlePanel("Plot From IRIS data"),                                             # Title to Document
    sidebarLayout(                                                                 # Create Split in form
        sidebarPanel(                                                              # Create Side Panel
            sliderInput("s_NumOfPts", "How many points should be used?",           
                        10, 150, value = 25),                                                                        # Add Slide bar for Random Points     
            selectInput("xAxis", "First Column to review (X-Axis)", names(iris[ , -5])),                             # Select Variable to compare    
            selectInput("yAxis", "Second Column to review (Y-Axis)", names(iris[ , -5]),selected = 'Petal.Length'),  # Select SEcond variable to compare
            checkboxInput("ib_RL", "Add regression line?", value = FALSE),                                          # Add Ability to add/remove regression line
                    ),
        mainPanel(                                                                 # Main display panel
            h3("Graph of Random Points"),                                          # Add title
            plotOutput("plot1")                                                    # Place plot returned from server.R      
        )
    )
))
