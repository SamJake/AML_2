library(ggplot2)
classes <- c("integer","character","integer","character","character","character","character")
tran <- read.csv("E:/R/AML_2/Data/tran.csv",colClasses = classes)

tran$WITHDRAWAL <- as.numeric(tran$WITHDRAWAL)
tran$DEPOSIT <- as.numeric(tran$DEPOSIT)
tran$BALANCE <- as.numeric(tran$BALANCE)
tran[is.na(tran)] <- 0
str(tran)

#Hierarchial Clustering
distances <- dist(tran[7], method="euclidean")
clust <- hclust(distances, method="ward.D2")
plot(clust)
cluster <- cutree(clust,k=3)
cluster
#Hierarchial Clustering

clust_data <- cbind(tran,cluster)
g <- ggplot(clust_data,aes(x=c(1:371),y=tran$BALANCE,color=factor(clust_data$cluster),group=clust_data$cluster)) + geom_point(size=1.5)
g <- g + ggtitle("AML 2.0 : Tran Clusters") + xlab("Transactions") + ylab("Account Balance") 
g <- g + scale_color_manual(values=c("orange","green2","purple"),name="Customer Profiling",labels=c("Low","Mid Range","High"))
g
ggsave("E:/R/AML_2/Images/Tran_Clusters.png")






#k-means Clustering 
#Ignore this part
cluster <- kmeans(tran[,7],3)
cluster$cluster
table(cluster$cluster, tran$ACC_ID)
#k-means Clustering



#ggplot(tran, aes(1:371,tran$BALANCE, color=tran$ACC_ID)) + geom_point()
