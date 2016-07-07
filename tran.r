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
  #names(tran_cluster_list[i]) <- paste("name",i,sep="")
  #tran_cluster_list[[i]] <- subset(tran.c,cluster==i)$ACC_ID
}

abc <- c("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")


k <- 3
for(i in 1:k)
{
  name1 <- abc[i]
  name2 <- paste(name1,i,sep="")
  acc <- get(name1)[,7]
  bal <- get(name1)[,3]
  assign(name2,aggregate(acc,list(bal),mean))
  print(name2)
  #print(acc)
  #print(bal)
}
