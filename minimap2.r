unsolid <- read.csv("~/Downloads/Hvir/Hvir_ragout_unsolid_2.paf",sep = "\t",header = FALSE)
a <- unsolid[unsolid$V13 == "tp:A:P",]
b <- a[a$V2 >=5000,]
c <- b[b$V11 >=1000,]
d <- c[c$V12 >= 60,]
## dv < 25%
e = d
duplicate <- e[duplicated(e$V6),]
length(unique(duplicate$V6))
## 1013
elements <- unique(duplicate$V6)
vec_1 <- NULL
q = 0
exclude = NULL
for (i in 1:1013){
  sub <- e[e$V6 == elements[i],]
  scaffolds = unique(sub$V1)
  ls = length(scaffolds)
  if (ls < nrow(sub)){
    for (x in 1:ls){
      subsub = sub[sub$V1 == scaffolds[x],]
      if (length(unique(subsub$V5))>1){
          vec_1 <- c(vec_1,as.character(elements[i]))
        }
      }
    }
}
length(vec_1)
## 10
inversions_1 = NULL
for (y in 1:10){
  add=e[e$V6 == vec_1[y],] 
  inversions_1 <- rbind(inversions_1,add)
}

solid <- read.csv("~/Downloads/Hvir/Hvir_ragout_solid_2.paf",sep = "\t",header = FALSE)
a <- solid[solid$V13 == "tp:A:P",]
b <- a[a$V2 >=5000,]
c <- b[b$V11 >=1000,]
d <- c[c$V12 >= 60,]
e = d
duplicate <- d[duplicated(d$V6),]
length(unique(duplicate$V6))
## 803
elements <- unique(duplicate$V6)
vec_2 <- NULL
q = 0
exclude = NULL
for (i in 1:803){
  sub <- e[e$V6 == elements[i],]
  scaffolds = unique(sub$V1)
  ls = length(scaffolds)
  if (ls < nrow(sub)){
    for (x in 1:ls){
      subsub = sub[sub$V1 == scaffolds[x],]
      if (length(unique(subsub$V5))==2){
        vec_2 <- c(vec_2,as.character(elements[i]))
      }
    }
  }
}
length(vec_2)
## 1
inversions_2 = NULL
for (y in 1:1){
  add=e[e$V6 == vec_2[y],] 
  inversions_2 <- rbind(inversions_2,add)
}
## compare to inversions_1
inversions_1[inversions_1$V6==as.character(unique(inversions_2$V6)),]

inversions_2

Dovetail <- read.csv("~/Downloads/Hvir/Dovetail_2.paf",sep = "\t",header = FALSE)
a <- Dovetail[Dovetail$V13 == "tp:A:P",]
b <- a[a$V2 >=5000,]
c <- b[b$V11 >=1000,]
d <- c[c$V12 >= 60,]
e=d
duplicate <- d[duplicated(d$V6),]
length(unique(duplicate$V6))
## 1024
elements <- unique(duplicate$V6)
vec_3 <- NULL
q = 0
exclude = NULL
for (i in 1:1024){
  sub <- e[e$V6 == elements[i],]
  scaffolds = unique(sub$V1)
  ls = length(scaffolds)
  if (ls < nrow(sub)){
    for (x in 1:ls){
      subsub = sub[sub$V1 == scaffolds[x],]
      if (length(unique(subsub$V5))==2){
        vec_3 <- c(vec_3,as.character(elements[i]))
      }
    }
  }
}
length(vec_3)
## 14
inversions_Dovetail = NULL
for (y in 1:14){
  add=e[e$V6 == vec[y],] 
  inversions_Dovetail <- rbind(inversions_Dovetail,add)
}

count=NULL
for (i in 1:length(vec_1)){
  count=c(count,vec_1[i] == vec_3)
}
count

## in the Dovetail assembly, structural errors/inversions that are located on scaffolds NWSH01002634.1, NWSH01000144.1, NWSH01003130.1, NWSH01008573.1, 
## NWSH01000329.1 look like repeats and should be false positives.
