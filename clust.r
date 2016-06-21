classes <- c("integer","character","integer","character","character","character","character")
tran <- read.csv("E:/R/AML_2/Data/tran.csv",colClasses = classes)

tran$WITHDRAWAL <- as.numeric(tran$WITHDRAWAL)
tran$DEPOSIT <- as.numeric(tran$DEPOSIT)
tran[is.na(tran)] <- 0

distances <- dist(tran[7], method="euclidean")
clust <- hclust(distances, method="single")
plot(clust)
cluster <- cutree(clust,k=3)
