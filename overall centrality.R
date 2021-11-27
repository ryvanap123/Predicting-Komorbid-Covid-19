library(readxl)
library(ggfortify)
Hasil_Centrality <- read_excel("Matrix analisis hasil.xlsx")
centrality <- Hasil_Centrality[,-1] #read the last column of the file
View(centrality)

pc <- prcomp(centrality, scale= TRUE) #implementing PCA using prcomp plugin
autoplot(pc, data = Hasil_Centrality, colour = 'Name')
pc
eValue <- pc$sdev^2 #looking up the eigen value
eValue
eVector <- pc$rotation #looking up the eigen vector
eVector[1:4,1]
#abs(eVector[1:4,1])
View(eVector[,1])

overall <- as.matrix(centrality) %*% eVector[1:4,1]
abs(overall)#multiply the last column (that already declared before, "centrality") with the corresponding eigenvector
overall_table <- cbind(abs(overall),Hasil_Centrality[,1]) #bind the result of overall centrality to the name of disease
overall_table
write.csv(overall_table, file = "Overall Centrality.csv", row.names = FALSE) #save the overall centrality
