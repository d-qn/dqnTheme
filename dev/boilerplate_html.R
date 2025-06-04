library(crosstalk)
library(plotly)
library(htmltools)
library(shiny)


charts <- 1:12 |> lapply(
  function(ii) {
    qplot(rnorm(100), geom = "histogram")    
  }
)

p <- plot_ly(x = rnorm(100))
fp <- fluidPage(
  fluidRow(charts[[1]]),
  fluidRow(
    column(6, charts[[2]]), column(6, charts[[3]]) 
  )
) 
fp |> browsable()

p <- plot_ly(x = rnorm(100))
fp <- fluidPage(
  fluidRow(p),
  fluidRow(
    column(6, p), column(6, p) 
  )
) 
fp |> browsable()
  
  
