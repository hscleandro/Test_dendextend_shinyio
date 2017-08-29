library(shiny)
library(dplyr) # This package enable de operator %>%
#library(dendextend)

ui <- basicPage(
  plotOutput("plot1", click = "plot_click")
)

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    dend <- mtcars$wt %>% 
      scale %>% 
      dist %>% 
      hclust(method = "ward.D2") %>%  
      as.dendrogram 
    
    barcolor <- rep("blue",length(labels(dend)))
    names(barcolor) <- labels(dend)
    
    plot(dend, main = "Teste dendextend in shinyio")
    
    #This is the only part that is necessary the dendextend R package
    #colored_bars(colors = barcolor, dend = dend )
  })
  
}

shinyApp(ui, server)