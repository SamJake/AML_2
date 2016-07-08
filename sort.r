#Sorting on acc_id internally for each cluster
backup1 <- kyc_cluster_list
for( l in 1:length(kyc_cluster_list))
{
  kyc_cluster_list[[l]] <- kyc_cluster_list[[l]][order(kyc_cluster_list[[l]]$ACC_ID),]
}

backup2 <- tran_cluster_list_agg
for( l in 1:length(tran_cluster_list_agg))
{
  tran_cluster_list_agg[[l]] <- tran_cluster_list_agg[[l]][order(tran_cluster_list_agg[[l]]$Group.1),]
}



#Calculating means for clusters
tran_cluster_means <- data.frame(cluster=integer(0),means=numeric(0))
for( n in 1:length(tran_cluster_list_agg))
{
  tran_cluster_means[n,1]  <- n
  tran_cluster_means[n,2] <- sum(tran_cluster_list_agg[[n]]$x)/length(tran_cluster_list_agg[[n]]$x)
}

kyc_cluster_means <- data.frame(cluster=integer(0),means=numeric(0))
for( n in 1:length(kyc_cluster_list))
{
  kyc_cluster_means[n,1]  <- n
  kyc_cluster_means[n,2]  <- sum(kyc_cluster_list[[n]]$INCOME)/length(kyc_cluster_list[[n]]$INCOME)
}

