#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
# fluid poage is default type of UI page, there are othersx
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Data Science Shiny UI"),
    
    ####### PROGRAM 1 STARTS ######  
    #Sidebar with a slider input for random number of points to plot
    #    sidebarLayout(
    #        sidebarPanel(
    #            numericInput("numeric","How many randoom numbers to be plotted", value = 1000, min =1, max=1 , step = 1),
    #            sliderInput("sliderX",
    #                        "Pick min and max X values:",
    #                        min = -100,
    #                        max = 100,
    #                        value = c(-50,50)),
    #            sliderInput("sliderY",
    #                        "Pick min and max Y values:",
    #                        min = -100,
    #                        max = 100,
    #                        value = c(-50,50)),
    #            checkboxInput("show_xlab","Show/Hide X Axis Label", value = TRUE),
    #            checkboxInput("show_ylab","Show/Hide Y Axis Label", value = TRUE),
    #            checkboxInput("show_title","Show/Hide Title", value = TRUE)
    #            
    #        ),
    
    # Show a plot of the generated distribution
    #       mainPanel(
    #         
    #            em("Graph of  ramdom points"),
    #            plotOutput("plot1"),
    #            code("done by Trinad")
    #        )
    ####### PROGRAM 1 ENDS ######
    
    
    ####### PROGRAM 2 STARTS ######
    #    sidebarLayout(
    #      sidebarPanel(
    #        sliderInput("sliderMPG","What is the MPG of the car?" , min = 10, max = 35, value = 20),
    #        checkboxInput("show_model1","Show/Hide Model 1", value = TRUE),
    #        checkboxInput("show_model2","Show/Hide Model 2", value = TRUE),
    #        submitButton("Submit") ## delayed reactivity, only reacts when button is submitted
    #    ),
    
    #  mainPanel(
    #        plotOutput("plot1"),
    #        h3("Predicted HorsePower from Model:1"),
    #        textOutput("pred1"),
    #        h3("Predicted HorsePower from Model:2"),
    #        textOutput("pred2")
    #  )
    #    )
    
    
    ####### PROGRAM 2 ENDS ######
    
    ####### PROGRAM 3 STARTS ######
    #    sidebarLayout(
    #          sidebarPanel(
    #            textInput("box1","Enter Tab1 Text:",value = "Tab 1"),
    #            textInput("box2","Enter Tab 2 Text:",value = "Tab 2"),
    #            textInput("box3","Enter Tab 3 Text:",value = "Tab 3")
    #          ),
    #          mainPanel(
    #              tabsetPanel(type = "tabs",
    #                          tabPanel("tab1",br(),textOutput("out1")),
    #                          tabPanel("tab2",br(),textOutput("out2")),
    #                          tabPanel("tab3",br(),textOutput("out3"))
    #                          
    #                          )
    #          )
    #      
    #      )
    
    
    ####### PROGRAM 3 ENDS ######
    
    ####### PROGRAM 4 STARTS ######
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut")
        ),
        mainPanel(
            plotOutput("plot1",brush = brushOpts(id="brush1"))
        )
    )
    
    ####### PROGRAM 4 ENDS ######
    
))
