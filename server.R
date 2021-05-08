library(shiny); library(UsingR)

shinyServer(function(input, output) {
    model1<-lm(child~parent,galton)
    
    model1pred<-reactive({
        predict(model1,newdata=data.frame(parent=input$sliderHeight))
    })
    
    output$plot1<-renderPlot({
        plot(galton$parent,galton$child,xlab="Parent Height",ylab="Child Height",
             bty="n",pch=16,xlim=c(62,75),ylim=c(60,75))
        if(input$sliderHeight){
            abline(model1,col="blue",lwd=2)
        }
        points(input$sliderHeight,model1pred(),col="blue",pch=16,cex=2)
    })
    
    output$pred1<-renderText({
        model1pred()
    })
})
