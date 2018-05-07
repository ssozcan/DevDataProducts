library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict MPG from different variables"),
  
  sidebarLayout(
    sidebarPanel(
       checkboxInput("predWt", "Predict with Weight", value = T),
       checkboxInput("predHp", "Predict with Horsepower", value = T),
       checkboxInput("predDisp", "Predict with Displacement", value = T)
       
    ),
    
    mainPanel(
      tabsetPanel(type="tabs", 
        tabPanel("Plots", br(), 
                 plotOutput("plot1"),
                 plotOutput("plot2"),
                 plotOutput("plot3")),
        tabPanel("Comparison", br(), textOutput("text1"),
                 textOutput("text2"),
                 textOutput("text3"))
          
       
    )
  )
))
)