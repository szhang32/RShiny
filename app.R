library(shiny)

ui <- fluidPage(
  titlePanel("My Bioinformatics App"),

  sidebarLayout(
    sidebarPanel(
      selectInput(
        "gene",
        "Select gene:",
        choices = c("TP53", "MYC", "SOX4")
      )
    ),

    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {

  output$plot <- renderPlot({
    plot(
      rnorm(100),
      main = paste("Expression of", input$gene)
    )
  })

}

shinyApp(ui, server)
