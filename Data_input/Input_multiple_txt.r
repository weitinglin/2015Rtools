

#original:https://psychwire.wordpress.com/2011/06/05/testing-different-methods-for-merging-a-set-of-files-into-a-dataframe/
# lapply method
lap = replicate(N, system.time(
  full_data<- do.call(
  "rbind",lapply(file_list,
  FUN=function(files){read.table(files,
  header=TRUE, sep="\t")})))[3])
lap

# plyr method
ply =
replicate(N, system.time(
  dataset <- ldply(file_list, read.table, header=TRUE, sep="\t")
)[3])
ply

# original method
orig=
replicate(N, system.time(
for (file in file_list){
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.table(file, header=TRUE, sep="\t")
  }
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
}
)[3])
orig
