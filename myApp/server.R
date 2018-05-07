library(shiny)

shinyServer(function(input, output) {
  
  model1 <- reactive({ 
    if(input$predWt){  
  
    lm(mpg~wt, data = mtcars)
    }
    })
  model2 <- reactive({ 
    if(input$predHp){  
      
      lm(mpg~hp, data = mtcars)
    }
  })
  model3 <- reactive({ 
    if(input$predDisp){  
      
      lm(mpg~disp, data = mtcars)
    }
  })
  
  output$plot1 = renderPlot({
    plot(mtcars$wt, mtcars$mpg, pch=19)
    abline(model1(), col="red", lw=3)
  output$plot2 = renderPlot({
    plot(mtcars$hp, mtcars$mpg, pch=19)
    abline(model2(), col="darkblue", lw=3)
  output$plot3 = renderPlot({
    plot(mtcars$disp, mtcars$mpg)
    abline(model3(), col="green", lw=3)
    
  })
  })

  R2_model1 <- reactive({summary(model1())$r.squared})
  R2_model2 <- reactive({summary(model2())$r.squared})
  R2_model3 <- reactive({summary(model3())$r.squared})
  
  output$text1 = renderText(paste("R square for model 1:", R2_model1()))
  output$text2 = renderText(paste("R square for model 2:", R2_model2()))
  output$text3 = renderText(paste("R square for model 3:", R2_model3()))
  
  })  
})
