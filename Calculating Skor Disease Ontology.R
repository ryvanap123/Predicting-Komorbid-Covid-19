print("Disease Ontologi")
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("DOSE")
library(DOSE)
dataDOID  <- read.csv("DOID.csv")
dataDOID
disease <-read.csv("disease.csv")
disease
print(dataDOID)
d <- as.vector(dataDOID[,])
e <- d
s <- doSim(d, e, measure="Wang")
s           
simplot(s,
        color.low="white", color.high="red",
        labs=TRUE, digits=2, labs.size=2,
        font.size=8, xlab="", ylab="")
size = length(d)
print(size)

N <- 1e4 
DF <- data.frame( txt=rep("", N), txt=rep("", N),num=rep(NA, N),num=rep(NA, N),  # as many cols as you need
                 stringsAsFactors=FALSE)          # you don't know levels yet
k=0
for(i in 1:size) {
  for(j in 1:size) {
    if( ((i < j)  && s[i,j]>0.5)) {
      k <- k+1
      print(s[i,j])
      DF[k, ] <- list(disease[i,],disease[j,],1,1)
    }
  }
}
print(k)
write.csv(DF,"cytoscape.csv", row.names = FALSE)
