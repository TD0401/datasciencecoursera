#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  ####### PROGRAM 1 STARTS ######   
#  output$plot1 <- renderPlot({
#
#        # generate bins based on input$bins from ui.R
  #     #   x    <- faithful[, 2]
     #   bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
      #hist(x, breaks = bins, col = 'darkgray', border = 'white')

        
  #        set.seed(11111)
  #        num_points <- input$numeric
  #        minX <- input$sliderX[1]
  #        maxX <- input$sliderX[2]
  #        minY <- input$sliderY[1]
  #        maxY <- input$sliderY[2]
        
  #        dataX <- runif(num_points , minX, maxX)
  #      dataY <- runif(num_points,minY, maxY)
  #      xlab <- ifelse(input$show_xlab, "X Axis","")
  #      ylab <- ifelse(input$show_ylab, "Y Axis","")
  #      main <- ifelse(input$show_title, "Title", "")
  #      plot(dataX, dataY, xlab = xlab, ylab = ylab, main  =  main , xlim = c(-100,100), ylim = c(-100,100))
  #  })

  ####### PROGRAM 1 ENDS ######
  
  ####### PROGRAM 2 STARTS ######  
#  mtcars$mpgsp <- ifelse(mtcars$mpg -20 > 0, mtcars$mpg- 20,0)
#  model1 <- lm (hp ~ mpg,data = mtcars)
#  model2 <- lm (hp ~ mpgsp + mpg , data = mtcars)
  
#  model1pred <- reactive({
#     mpgInput <- input$sliderMPG
#     predict(model1, newdata =data.frame(mpg = mpgInput) )
#  })
  
#  model2pred <- reactive({
#    mpgInput <- input$sliderMPG
#    predict(model2, newdata =data.frame(mpg = mpgInput,mpgsp = ifelse(mpgInput -20> 0, mpgInput - 20, 0 )) )
#  })
  
#  output$plot1 <- renderPlot({
#    mpgInput <- input$sliderMPG
#    
#    plot(mtcars$mpg,mtcars$hp, xlab="Miles per gallon", ylab = "HorsePower", bty="n", pch = 16, 
  #         xlim = c(10,35), ylim = c(50,350))
    
  #    if(input$show_model1){
  #      abline(model1, col="red", lwd = 2)
  #    }
  #    if(input$show_model2){
  #      model2lines <- predict(model2,newdata = data.frame(mpg = 10:35,mpgsp = ifelse(10:35-20> 0 ,10:35-20,0)))
  #      lines(10:35, model2lines, col= "blue",lwd= 2)
  #    }
    
  #    legend(25,250, c("Model 1 Prediction","Model 2 Prediction"),pch = 16,col = c("red","blue"),
  #           bty= "n",cex = 1.2)
  #    points(mpgInput, model1pred(), col = "red", pch = 16 , cex = 2)
  #    points(mpgInput, model2pred(), col = "red", pch = 16 , cex = 2)
  #    
  #    output$pred1 <- renderText({model1pred()})
  #    output$pred2 <- renderText({model2pred()})
  #  })
  
  
  
  ####### PROGRAM 2 ENDS ######  
  
  ####### PROGRAM 3 STARTS ######  
#  output$out1 <- renderText(input$box1)
#  output$out2 <- renderText(input$box2)
#  output$out3 <- renderText(input$box3)
  ####### PROGRAM 3 ENDS ######  
  
  
  ####### PROGRAM 4 STARTS ######  
  model <- reactive({
    brushed_data <- brushedPoints(trees,input$brush1, xvar = "Girth" , yvar ="Volume")
    if(nrow(brushed_data) <2){
      return(NULL)
    }
    lm (Volume ~Girth, data = brushed_data)
  })
  
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model found"
    }else{
      model()[[1]][2]
    }
  })
  
  output$intOut<- renderText({
    if(is.null(model())){
      "No Model found"
    }else{
      model()[[1]][1]
    }
  })
  
  output$plot1 <- renderPlot({
    plot(trees$Girth,trees$Volume, xlab = "Girth", ylab = "Volume", main = "Tree Measurements",
         cex=1.5,pch = 16, bty = "n")
    if(is.null(model())){
      abline(model(),col="blue",lwd=2)
    }
  })
  
  ####### PROGRAM 4 ENDS ######  

})
