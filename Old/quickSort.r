ll <- kyc_cluster_list

quickSort <- function(lst) {
  if (length(lst) <= 1) {
    return(lst)
  }

  element <- lst[1]
  partition <- lst[-1]
  v1 <- partition[partition < element]
  v2 <- partition[partition >= element]
  # Recursively apply steps to smaller lstors.
  v1 <- quickSort(v1)
  v2 <- quickSort(v2)
  return(c(v1, element, v2))
}


quickSort(ll)



element <- ll[1]
partition <- ll[-1]




kyc_cluster_means.df <- kyc_cluster_means
kyc_cluster_means.lst <- setNames(split(kyc_cluster_means.df,seq(nrow(kyc_cluster_means.df))),rownames(kyc_cluster_means.df))