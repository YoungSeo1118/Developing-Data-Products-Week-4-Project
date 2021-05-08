library(shiny); library(UsingR); galton
shinyUI(fluidPage(
    titlePanel("Prediction of Son's Height based on Parent's Height"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderHeight","Parent Height:",min = 63,max = 74,value = 68),
            submitButton("Submit")
            ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Son's Height:"),
            textOutput("pred1")
        )
    )
))
