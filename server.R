library(shiny)
library(ggplot2)
library(doBy)
library(reshape2)
library(stringr)


# Define server logic required to plot variables
shinyServer(function(input, output) {
  
  
firmDateData <- reactive({  
   dataToPlot(input$firmName,input$dateRange)
  }) #firmdatetData
  
  
# Generate a plot of the requested variables
output$plot<-renderPlot({
  plotData<-firmDateData()
  if (input$dateRange=="Last Month")
  {
    tabledta<-summaryBy(y1+y2~date+x1,data=plotData,FUN=mean,keep.names=TRUE)
    data.melt <- melt(tabledta,id.vars=c('date','x1'),all=TRUE)
    p<-ggplot(data.melt,aes(x=date, y=value,group=variable,colour=variable))+geom_line()+facet_wrap(~x1,scales='free_y',ncol=1)+ylab("value of y1 and y2")+ theme(axis.text.x = element_text(angle = -90, hjust = 1))
  }
  else if (input$dateRange=="Last Quarter") 
  { 
    tabledta<-summaryBy(y1+y2~YEARWEEK+x1,data=plotData,FUN=sum,keep.names=TRUE)
    data.melt <- melt(tabledta,id.vars=c('YEARWEEK','x1'),all=TRUE)
    p<-ggplot(data.melt,aes(x=YEARWEEK, y=value,group=variable,colour=variable))+geom_line()+facet_wrap(~x1,scales='free_y',ncol=1)+ylab("value of y1 and y2")+ theme(axis.text.x = element_text(angle = -90, hjust = 1))
  }
  else 
  {
    tabledta<-summaryBy(y1+y2~MONTHDATE+x1,data=plotData,FUN=sum,keep.names=TRUE)
    data.melt <- melt(tabledta,id.vars=c('MONTHDATE','x1'),all=TRUE)
    p<-ggplot(data.melt,aes(x=MONTHDATE, y=value,group=variable,colour=variable))+geom_line()+facet_wrap(~x1,scales='free_y',ncol=1)+ylab("value of y1 and y2")+ theme(axis.text.x = element_text(angle = -90, hjust = 1))
  }
  print(p)
})
output$subset <- renderDataTable({
firmDateData()[, input$show_vars, drop = FALSE]
},options=list(iDisplayLength = 10),list(bSortClasses = TRUE))
})