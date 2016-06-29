#Identifying misfits in clusters or to_be_flagged transactions
aml_flag <- matrix(0,ncol = 1,nrow = nrow(tran))
tran2 <- cbind(tran,aml_flag)


for(i in 1:3)#3=k in hierarchial clustering
{
  temp_kyc_cluster <- subset(kyc,cluster2==i)
  for(j in 1:nrow(temp_kyc_cluster))
  {
    print(temp_kyc_cluster[j,1])
  }
  print(paste("End of ",i,"th cluster"))
}

temp_kyc_cluster <- subset(kyc,cluster2==1)
nrow(temp_kyc_cluster)
kyc[,1]



c <- 12400528
temp_tran_cluster <- subset(tran,cluster==2)
flagged <- subset(temp_tran_cluster,ACC_ID==c)
temp_tran <- flagged$TRAN_ID
if(nrow(flagged)>0)
{
  tran2[,TRAN_ID==temp_tran]$aml_flag<- 1 #setting AML flag
}


temp_tran_cluster <- subset(tran,cluster==3)
flagged <- subset(temp_tran_cluster,ACC_ID==c)
nrow(flagged)


flag_id <- grep(temp_tran,tran2$TRAN_ID)
tran2[flag_id,8] <- 1
head(tran2,10)
