library(shiny)
library(ggplot2)

ui <- fluidPage(
  headerPanel('Interactive Plot 1'),
  mainPanel(
    plotOutput("plot1", click = "plot_click"),
    verbatimTextOutput("info")
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
  })
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
}

shinyApp(ui = ui, server = server)
