#Get PMID
library(RISmed)
search_topic <- 'comorbid covid-19'
search_query <- EUtilsSummary(search_topic, retmax=400, mindate=2020, maxdate=2021)
summary(search_query)
pmid_list <- QueryId(search_query)   #19 Februari 2021
pmid_list

#Read file annotation extraction from Pubterm
library(readxl)
my_data <- read_excel("Fix Wordcloud.xlsx")
#View(my_data)
istilah <- my_data$Term
frekuensi <- my_data$Freq

#Word Cloud
library(wordcloud)
library(RColorBrewer)
dev.new(width=5, height=4)
wordcloud(words = istilah, freq = frekuensi, scale=c(2,.1), min.freq = 2, max.words=45, random.order=FALSE, random.color=TRUE, rot.per=.2, colors=brewer.pal(8, "Dark2"))

