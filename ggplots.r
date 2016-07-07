clust_data2 <- cbind(kyc,cluster2)
g2 <- ggplot(clust_data2,aes(x=factor(c(1:12)),y=kyc$INCOME,color=factor(clust_data2$cluster2),group=clust_data2$cluster2)) + geom_point(size=2)
g2 <- g2 + ggtitle("AML 2.0 : KYC Clusters") + xlab("Customers") + ylab("Annual Income") 
g2 <- g2 + scale_color_manual(values=c("orange","green2","purple"),name="Customer Profiling",labels=c("Low","Mid Range","High"))
g2
ggsave("E:/R/AML_2/Images/Kyc_Clusters.png")









clust_data <- cbind(tran,cluster)
g <- ggplot(clust_data,aes(x=c(1:371),y=tran$BALANCE,color=factor(clust_data$cluster),group=clust_data$cluster)) + geom_point(size=1.5)
g <- g + ggtitle("AML 2.0 : Tran Clusters - Suspicious transaction") + xlab("Transactions") + ylab("Account Balance") 
g <- g + scale_color_manual(values=c("orange","green2","purple"),name="Customer Profiling",labels=c("Low","Mid Range","High"))
g
ggsave("E:/R/AML_2/Images/Tran_Clusters_susp.png")