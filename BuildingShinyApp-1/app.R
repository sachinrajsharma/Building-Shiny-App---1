library(ggplot2)

library(tidyverse)
library(dplyr)
library(shiny)

data <- read.csv("data_2.csv")
head(data)



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput(inputId = "checked_groups",
                        label = "Which groups do you want to display",
                        choices = c("a","b","c"),
                        selected = c("a","b","c")
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("scatter")
        )
    )
)

# Define server logic 
server <- function(input, output) {
    output$scatter <- renderPlot({
       plot_data <- filter(data,Group %in% input$checked_groups)
        
       ggplot(data = plot_data,
              aes(x = varX, y = varY, color = Group))+geom_point()
       })
}
    
    # Run the application 
shinyApp(ui = ui, server = server)
