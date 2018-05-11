library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 

# It should take as an input the x_var, y_var, color, and size
# Save the result of `renderPlot` to output$scatter
shinyServer(function(input, output) {
  output$scatter <- renderPlot({
    # Store x and y values to plot
    x <- mpg[[input$xVar]]
    y <- mpg[[input$yVar]]
    
    # Store the title of the graph in a variable
    title <- paste0("MPG Dataset: ", input$xVar, " v.s.", input$yVar)
    
    # Create ggplot scatter
    p <- ggplot() +
      geom_point(mapping = aes(x = x, y = y), 
                 size = input$size, 
                 color = input$color) +
      labs(x = input$xVar, y = input$yVar, title = title)
    p
  })
})