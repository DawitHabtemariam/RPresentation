
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(ggplot2)
data(airquality)
date<-paste(airquality$Month,airquality$Day,sep="-")
date<-paste("1973",date,sep="-")
Time<-as.Date(date,"%Y-%m-%d")
dataSet<-data.frame(airquality,Time)


shinyServer(function(input, output) {
  
  output$summary<-renderTable(
  if(input$summary){
  
   summary(dataSet,na.rm=T)}
  )
  
  

  output$airqualityPlot<-renderPlot(
    
    qplot(dataSet[dataSet$Temp %in% input$temperature[1]:input$temperature[2],7],dataSet[dataSet$Temp %in% input$temperature[1]:input$temperature[2],input$choice],
          data=dataSet[dataSet$Temp %in% input$temperature[1]:input$temperature[2],],xlab="Time",ylab=as.character(input$choice),main="Climate Graph")+geom_smooth(method="lm"))
  
 
  }
)
