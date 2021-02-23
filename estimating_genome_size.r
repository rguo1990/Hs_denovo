## R script to plot k-mer occurrence distribution in paired-end library

dataframe19 <- read.table("~/Downloads/19mer_out.histo")
plot(dataframe19[1:200,], type="l")

## In general, very low frequency k-mer represent extremely high numbers that would make the scale of the y-axis too large
## we discarded the first several columns and re-plot the figure
plot(dataframe19[5:200,], type="l")

points(dataframe19[5:200,])
dataframe19[10:60,]
## from the plot, we determined that the peak position was 48
nrow(dataframe19)
## 9997
## the total number of k-mer in the distribution
sum(as.numeric(dataframe19[5:9997,1]*dataframe19[5:9997,2]))
## 17517864459

## single copy region can be calculated as
sum(as.numeric(dataframe19[5:65,1]*dataframe19[5:65,2]))/48
## 264380989
## the proportion of single copy region is
(sum(as.numeric(dataframe19[5:65,1]*dataframe19[5:65,2])))/17517864459
## = 264380989 * 48/17517864459
## = 72.44%
## the heterozygous rate is = 1-72.44% = 27.56%

## the total genome size
sum(as.numeric(dataframe19[5:9997,1]*dataframe19[5:9997,2]))/48
## 364955510

## compared with Poisson distribution
singleC <- sum(as.numeric(dataframe19[5:80,1]*dataframe19[5:80,2]))/48
poisdtb <- dpois(1:100,48)*singleC
plot(poisdtb, type='l', lty=2, col="green",
     main = "K-mer occurrence frequency",xlab="K-mer coverage",ylab="K-mer counts frequency")
lines(dataframe19[5:100,48] * singleC, type = "l", col=3)#, Ity=2)
lines(dataframe19[5:100,],type= "l")
legend("topright",c("C.virescens","Poisson distribution"),col=c("black","green"),lty=c(1,2),cex = 0.8,inset = 0.01, box.col = "white")

