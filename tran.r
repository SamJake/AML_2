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



#Replacement for above ten lines -- Aggregation - count & means
tran_cluster_list_agg <- list()
for(m in 1:length(tran_cluster_list)) 
{
  acc <- tran_cluster_list[[m]][,3]
  bal <- tran_cluster_list[[m]][,7]
  temp1 <- aggregate(bal,list(acc),mean)#meansdf
  temp2 <- aggregate(bal,list(acc),length)#countdf
  temp3 <- cbind(temp1,temp2)
  temp3 <- temp3[,-3]
  tran_cluster_list_agg[[m]] <- temp3
}
