packages <- c("devtools","factoextra","cluster","NbClust","ggplot2")
if(length(setdiff(packages,rownames(installed.packages())))>0)
  {
      install.packages(setdiff(packages,rownames(installed.packages())))
  }
sapply(packages,library,character.only=TRUE)

kyc <- read.csv("E:/R/AML_2/Data/kyc.csv")

set.seed(123)
k <- 3
s.kyc <- scale(kyc[,13])
k.kyc <- kmeans(s.kyc,k)
k.kyc$cluster


fviz_cluster(k.kyc,data = s.kyc,geom = "point", stand=FALSE, frame.type = "norm")
