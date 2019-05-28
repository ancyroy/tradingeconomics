#load tradingeconomics library
library ("tradingeconomics")
# login as guest
login()
# reading the (allowed free data for guest login) United staes GDP historical data for the period 2009/12/31 to 2017/12/31  
myhistoricaldata <-getHistoricalData(country='United States',indicator='GDP',initDate='2009-12-31',endDate='2017-12-31',outType='df' )
print (myhistoricaldata)
# change datetime format to date format in data
myhistoricaldata$DateTime <- format(as.Date(myhistoricaldata$DateTime), "%Y/%m/%d")
# create bar chart using GDP data
myXvalue <- myhistoricaldata$Value
myYvalue <- myhistoricaldata$DateTime
barplot(myXvalue,names.arg=myYvalue,xlab="Year",ylab="GDP",col="grey",main="US GDP - 2009-2017",border="black")
# reading latest news on US stock and printing only date/time and news details 
mynews <- getLatestNews(identifier=c('stock market'),category="indicator",limit='5',start='1',outType='df')
print (paste0(mynews$date,mynews$description))
