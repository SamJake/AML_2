library(ggplot2)
set.seed(123)
classes <- c("integer","character","integer","character","character","character","character")
tran <- read.csv("E:/R/AML_2/Data/tran.csv",colClasses = classes)

tran$WITHDRAWAL <- as.numeric(tran$WITHDRAWAL)
tran$DEPOSIT <- as.numeric(tran$DEPOSIT)
tran$BALANCE <- as.numeric(tran$BALANCE)
tran[is.na(tran)] <- 0

#Hierarchial Clustering
distances <- dist(tran[7], method="euclidean")
clust <- hclust(distances, method="ward.D2")
plot(clust)

jpeg("E:/R/AML_2/Images/Tran_Clusters_Hier.jpeg")
plot(clust, labels=FALSE, hang = -1.5)
rect.hclust(clust,k=4,border = 2:4)
dev.off()


cluster <- cutree(clust,k=3)
cluster
#Hierarchial Clustering

jpeg("E:/R/AML_2/Images/Tran_Clusters_Elbow.jpeg")
fviz_nbclust(tran,hcut,method = "wss") + geom_vline(xintercept = 4, linetype = 2)
dev.off()

tran.c <- cbind(tran,cluster)

tran_cluster_list <- list()
k <- 3
for(i in 1:k)
{
  tran_cluster_list[[i]] <- subset(tran.c,cluster==i)
}


for(i in 1:k)
{
  assign(paste("temp",i) <- tran_cluster_list[[i]])
  #assign(paste("temp",i,"ave" <- aggregate(temp1[,7],list(temp1$ACC_ID),mean))
}

