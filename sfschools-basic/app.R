library(shiny)
library(leaflet)

ui <- fluidPage(
  leafletOutput("mymap")
)


# Define server logic required to draw a histogram
server <- function(input, output, session) {
  d <- read.csv("schools_math_eng_scores.csv")
  output$mymap <- renderLeaflet({
  m <- leaflet() %>%
    addTiles() %>%
    addMarkers(data = d, lng = ~longitude, lat = ~latitude,
               popup = ~paste("<h4>", school_name, "</h4>",
                              "Score: ", score, sep = ""))
  })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

