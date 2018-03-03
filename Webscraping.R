# First Install packages
install.packages("rvest")  #used for Webscraping
install.packages("xlsx")   #used for converting into xlsv format


library(rvest)#load packages
library(xlsx)# load packages


#choose your url
data.url<-read_html("http://www.imdb.com/chart/toptv/?ref_=nv_tp_tv250_2")

#choose what you want to retrive
Title<-data.url%>%html_nodes(".titleColumn a")%>%html_text()
Rank<-data.url%>%html_nodes(".imdbRating")%>%html_text()



#convert it into dataframe
orgdata<-data.frame(Title,Rank)

# write in Xlsx file
write.xlsx(x = orgdata, file = "Output.xlsx",
           sheetName = "IMDb Data", row.names = FALSE)

