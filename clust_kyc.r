packages <- c("devtools","factoextra","cluster","NbClust","ggplot2")
if(length(setdiff(packages,rownames(installed.packages())))>0)
{
  install.packages(setdiff(packages,rownames(installed.packages())))
}
sapply(packages,library,character.only=TRUE)

kyc <- read.csv("E:/R/AML_2/Data/kyc.csv")
set.seed(123)
#Hierarchial Clustering
distances2 <- dist(kyc[9:12], method="euclidean")
clust2 <- hclust(distances2, method="ward.D2")
plot(clust2)
jpeg("E:/R/AML_2/Images/Kyc_Clusters_Hier.jpeg")
plot(clust2, labels=FALSE, hang = -1)
rect.hclust(clust2, k=3, border = 2:4)
dev.off()

cluster2 <- cutree(clust2,k=3)
cluster2
#Hierarchial Clustering

jpeg("E:/R/AML_2/Images/Kyc_Clusters_Elbow.jpeg")
fviz_nbclust(kyc,hcut,method = "wss") + geom_vline(xintercept = 3, linetype = 2)
dev.off()









clust_data2 <- cbind(kyc,cluster2)
g2 <- ggplot(clust_data2,aes(x=factor(c(1:12)),y=kyc$INCOME,color=factor(clust_data2$cluster2),group=clust_data2$cluster2)) + geom_point(size=2)
g2 <- g2 + ggtitle("AML 2.0 : KYC Clusters") + xlab("Customers") + ylab("Annual Income") 
g2 <- g2 + scale_color_manual(values=c("orange","green2","purple"),name="Customer Profiling",labels=c("Low","Mid Range","High"))
g2
ggsave("E:/R/AML_2/Images/Kyc_Clusters.png")
