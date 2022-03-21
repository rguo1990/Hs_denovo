## a script to plot Figure 1b, 1c, 1d

lepidoptera <- readxl::read_excel("/Users/rongguo/UMD/Hs_denovo/writing/Manuscript/Table S2.xlsx",skip = 1,
                                  col_types = c("text", "text", "text","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric",
                                                "numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
max(lepidoptera$`Scaffold N50`)
min(lepidoptera$`Scaffold N50`)
mean(lepidoptera$`Scaffold N50`)
median(lepidoptera$`Scaffold N50`)
max(lepidoptera$`Total Genome Size`)
min(lepidoptera$`Total Genome Size`)

ratio <- lepidoptera$`Total Genome Size`/lepidoptera$`Scaffold N50`
lepidoptera_log10 <- log10(lepidoptera$`Scaffold N50`)

## plot figure 1b -- contiguities of Lepidopteran assembled genomes
png("Figure 1b.png",units="in", width=11, height=5,res=300)
ggplot(data=lepidoptera,aes(x=`Family`,y=lepidoptera_log10,fill=`Family`)) + geom_boxplot(varwidth = TRUE) + geom_point(col = "black") +
  labs(x="Lepidoptera families",y="log10(N50)",title="Contiguities of Lepidopteran Assembled Genomes") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(size = 10, color = "black",vjust = 0.5, hjust = 0.5, angle = 45)) +
  theme(axis.title.x = element_text(size = 15, face = "bold")) +
  theme(axis.title.y = element_text(size = 15, face = "bold")) +
  theme(title = element_text(size = 18, face = "bold")) 
dev.off()
  
## plot figure 1c -- N50 vs. Total Genome Size
sh <- c(1,2,2,2,3,4,4,4,5,6,7,8,9,9,9,10,11,12,rep(13,11),rep(14,32),rep(15,8),rep(16,6),17,18,19,19,19,20,20,21,22,22,23,23)
d <- cbind(lepidoptera,sh)
family <- lepidoptera$Family
png("Figure 1c.png",units="in", width=8, height=5,res=300)
par(mar=c(5, 4, 4, 8), xpd=TRUE)
plot(x=d$`Total Genome Size`,y=lepidoptera_log10,col = c("sienna","bisque2","blue","brown","coral","orange","darkblue",
                                                         "gold","gray","cyan","pink","yellow","maroon","navy","green","purple",
                                                         "darkred","seashell","tan","violet","yellowgreen","hotpink","black")[d$sh],pch=19,
     xlab = "Total Genome Size",ylab="log10(N50)",main="N50 vs. Total Genome Size")
legend("bottomright",inset = c(-0.2, 0),xpd = TRUE,bty="n",legend = unique(family),col = c("sienna","bisque2","blue","brown","coral","orange","darkblue",
                                                     "gold","gray","cyan","pink","yellow","maroon","navy","green","purple",
                                                     "darkred","seashell","tan","violet","yellowgreen","hotpink","black"),pch = 19,cex=0.66,ncol = 1,text.font = 3)

dev.off()

## the range of completeness
min(lepidoptera$`C (%)`)
max(lepidoptera$`C (%)`)
mean(lepidoptera$`C (%)`)
median(lepidoptera$`C (%)`)

## plot figure 1d -- completeness of Lepidopteran assembled genomes
png("Figure 1d.png",units="in", width=11, height=5,res=300)
ggplot(data=lepidoptera,aes(x=Family,y=`C (%)`,fill=`Family`)) + geom_boxplot(varwidth = TRUE) + geom_point(col="black") +
  labs(x="Lepidoptera families",y="Completeness (%)",title="Completeness of Lepidopteran Assembled Genomes") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(size = 10, color = "black",vjust = 0.5, hjust = 0.5, angle = 45)) +
  theme(axis.title.x = element_text(size = 15, face = "bold")) +
  theme(axis.title.y = element_text(size = 15, face = "bold")) +
  theme(title = element_text(size = 18, face = "bold")) 
dev.off()
