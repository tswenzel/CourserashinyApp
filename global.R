library(stringr)
testData <<-data.frame(firm=rep(LETTERS[1:10],each=500),
                       date=as.Date("2012-01-01")+1:500,
                       y1=sample(1:100,50),y2=sample(1:100,50),y3=sample(1:100,50),x1=sample(1:2))

testData$X<-NULL
testData$date<-as.Date(testData$date)
testData$date <- format(testData$date,'%Y-%m-%d')
testData$MONTHDATE = as.Date(paste(paste0('20',str_sub(strftime(testData$date,'%y')), start= -2),strftime(testData$date,'%m'),'01',sep='-'))
testData$MONTHDATE <- format(testData$MONTHDATE,'%Y-%m-%d')

nweek <- function(x, format="%Y-%m-%d")
{as.integer(format(strptime(x, format=format), "%W"))
}
testData$WEEKDATE<-nweek(testData$date)
testData$YEARWEEK<-paste(strftime(testData$date,'%y'),testData$WEEKDATE,sep='-')


dataToPlot<-function(firmName="All", dateRange="All")
{
  td <- max(as.Date(testData$date))
  if(firmName=='All'){
    if (dateRange=='Last Month'){plotData <-testData[testData$date>=(td-30),]}
    else if (dateRange=='Last Quarter'){plotData <-testData[testData$date>=(td-90),]}
    else if (dateRange=='Last Year'){plotData <-testData[testData$date>=(td-356),]} 
    else if (dateRange=='All') {plotData <-testData}
  }
  else{
    if (dateRange=='Last Month'){plotData <-testData[(testData$date>=(td-30)&(testData$firm==firmName)),]}
    else if (dateRange=='Last Quarter'){plotData <-testData[(testData$date>=(td-90)&(testData$firm==firmName)),]}
    else if (dateRange=='Last Year'){plotData <-testData[(testData$date>=(td-356)&(testData$firm==firmName)),]}
    else if (dateRange=='All') {plotData <-testData[testData$firm==firmName,]}
  }
}
