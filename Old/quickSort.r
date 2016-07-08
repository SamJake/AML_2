kyc_cluster_means.df <- kyc_cluster_means
kyc_cluster_means.lst <- setNames(split(kyc_cluster_means.df,seq(nrow(kyc_cluster_means.df))),rownames(kyc_cluster_means.df))

lst <- kyc_cluster_means.lst

quickSort <- function(lst) {
  if (length(lst) <= 1) {
    return(lst)
  }

  element <- lst[1]
  print(element)
  partition <- lst[-1]
  print(partition)
  
  v1 <- partition[data.frame(lst[partition]$X1.means < data.frame(lst[element]$X1.means]
  print(v1)
  # v2 <- partition[partition >= element]
  # # Recursively apply steps to smaller lstors.
  # v1 <- quickSort(v1)
  # v2 <- quickSort(v2)
  # #return(c(v1, element, v2))
}


quickSort(lst)
data.frame(kyc_cluster_means.lst[1])$X1.means

lst[1]$means