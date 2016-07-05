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

clust_data <- cbind(tran,cluster)
g <- ggplot(clust_data,aes(x=c(1:371),y=tran$BALANCE,color=factor(clust_data$cluster),group=clust_data$cluster)) + geom_point(size=1.5)
g <- g + ggtitle("AML 2.0 : Tran Clusters - Suspicious transaction") + xlab("Transactions") + ylab("Account Balance") 
g <- g + scale_color_manual(values=c("orange","green2","purple"),name="Customer Profiling",labels=c("Low","Mid Range","High"))
g
ggsave("E:/R/AML_2/Images/Tran_Clusters_susp.png")


