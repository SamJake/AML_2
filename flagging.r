#Identifying misfits in clusters or to_be_flagged transactions
aml_flag <- matrix(0,ncol = 1,nrow = nrow(tran))
tran2 <- cbind(tran,aml_flag)

n <- 3 
for(i in c(2,3))
{
  temp_kyc_cluster <- subset(kyc,cluster2==i)
  for(j in 1:nrow(temp_kyc_cluster))
  {
    temp_acc <- temp_kyc_cluster[j,1]
    temp_tran_cluster <- subset(tran,cluster==i)
    flagged <- subset(temp_tran_cluster,ACC_ID==temp_acc)
    if(nrow(flagged)>0)
    {
      for(k in 1:nrow(flagged))
      {
        temp_tran <- flagged[k,1]
        flag_id <- grep(temp_tran,tran2$TRAN_ID)
        tran2[flag_id,8] <- 1
      }
    }
  }
  print(paste("End of ",i,"th cluster"))
}
