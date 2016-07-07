#kyc <- read.csv("E:/R/AML_2/Data/kyc.csv")
names(kyc)
k_dist <- dist(kyc[9:12], method="euclidean")
c <- hclust(k_dist, method = "ward.D2")

kyc_cluster <- list()

for(i in 1:12)
{
  kyc_cluster[[i]] <- cutree(c,k=i)
}

for(i in 1:12)
{
  print(kyc_cluster[[i]])
}
