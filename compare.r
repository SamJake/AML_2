kyc_cluster_list
tran_cluster_list_agg

flag <- data.frame(ACC_ID=integer(0),cluster=integer(0))
n <- 0
for(x in 1:(length(kyc_cluster_list)-1))#x=#clusters-1 --2
{
  for(y in 1:length(kyc_cluster_list[[x]]$ACC_ID))#y=#accounts in kyc cluster --4
  {
    for(z in 1:length(tran_cluster_list_agg[[x+1]]$Group.1))#z=#accounts in next tran cluster (agg) --5
    {
      if (kyc_cluster_list[[x]][y,1] == tran_cluster_list_agg[[x+1]][z,1])
      {
        n <- n+1
        print(paste(kyc_cluster_list[[x]][y,1],"-", tran_cluster_list_agg[[x+1]][z,1]))
        flag[n,1] <- tran_cluster_list_agg[[x+1]][z,1]
        flag[n,2] <- x+1
      }
    }
  }
}
    