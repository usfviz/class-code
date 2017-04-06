library(shiny)
library(ggvis)

ui <- fluidPage(
  headerPanel('Interactive with ggvis'),
  sidebarPanel(
    sliderInput("size", "Area", 10, 100, 10)
  ),
  mainPanel(
    uiOutput("ggvis_ui"),
    ggvisOutput("ggvis")
  )
)

server <- function(input, output) {
  input_size <- reactive(input$size)
  
  all_values <- function(x) {
    if(is.null(x)) return(NULL)
    row <- mtc[mtc$id == x$id, ]
    paste0(names(row), ": ", format(row), collapse = "<br />")
  }

  mtc <- mtcars
  mtc$id <- 1:nrow(mtc)
  mtc %>% 
    ggvis(~disp, ~mpg, size := input_size, key := ~id) %>%
    add_tooltip(all_values, "hover") %>%
    layer_points() %>%
    bind_shiny("ggvis", "ggvis_ui")
  
}


shinyApp(ui = ui, server = server)

