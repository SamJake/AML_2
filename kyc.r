#package install
packages <- c("devtools","factoextra","cluster","NbClust","ggplot2")
if(length(setdiff(packages,rownames(installed.packages())))>0)
{
  install.packages(setdiff(packages,rownames(installed.packages())))
}
sapply(packages,library,character.only=TRUE)

set.seed(123)
kyc <- read.csv("E:/R/AML_2/Data/kyc.csv")



#Hierarchial Clustering
distances2 <- dist(kyc[9:12], method="euclidean")
clust2 <- hclust(distances2, method="ward.D2")

plot(clust2)
jpeg("E:/R/AML_2/Images/Kyc_Clusters_Hier.jpeg")
plot(clust2, labels=FALSE, hang = -1)
rect.hclust(clust2, k=3, border = 2:4)
dev.off()

cluster2 <- cutree(clust2,k=3)
#Hierarchial Clustering



jpeg("E:/R/AML_2/Images/Kyc_Clusters_Elbow.jpeg")
fviz_nbclust(kyc,hcut,method = "wss") + geom_vline(xintercept = 3, linetype = 2)
dev.off()



kyc.c <- cbind(kyc,cluster2)
kyc_cluster_list <- list()
k <- 3
for(i in 1:k)
{
  kyc_cluster_list[[i]] <- subset(kyc.c,cluster2==i)
}