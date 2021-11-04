## The R script to plot Figure 4: improved N50 values and completeness of H.zea and H.arm assemblies

names <- c("H.zea","H.zea_solid","H.zea_unsolid","H.arm","H.arm_solid","H.arm_unsolid")
N50 <- c(201477,6100690,8865798,1000414,9477009,9240022)
completeness <- c(0.964,0.966,0.963,0.974,0.974,0.971)
data <- rbind(N_50,completeness)
colnames(data) <- names
plot(x = 1:6, y = N50,col = "red",pch = 19,xaxt = "n",type = "b",xlab = "Assemblies",main="Improved N50 Values and Completeness")
text(x=1:6,y=N50,labels = N50,cex=0.4,pos=1,col="red")
par(new = TRUE)
plot(x = 1:6, y = completeness, col = "blue",pch=19,xaxt = "n", type = "b",ylim = c(0.9,1),yaxt = "n",ylab = "",xlab = "")
text(x=1:6,y=completeness,labels = completeness,cex=0.4,pos=1,col="blue")
axis(side = 1,at=c(1,2,3,4,5,6),labels = names)
axis(side = 4,at=c(0.9,0.92,0.94,0.96,0.98,1))
mtext("Completeness", side = 4,line = -1)
legend("bottomright", c("N50", "Completeness"), cex =0.8,
       col = c("red", "blue"), pch = c(19, 19))
