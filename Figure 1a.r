## R script to plot figure 1a -- contiguities of insect assembled genomes

genomes <- readxl::read_excel("/Users/rongguo/UMD/Hs_denovo/writing/Manuscript/Table S1.xlsx")
log10_N50 <- log10(genomes$`Scaffold N50`)
l <- length(log10_N50)
d <- cbind(genomes,1:l,log10_N50)
max(genomes$`Scaffold N50`)
min(genomes$`Scaffold N50`)
median(genomes$`Scaffold N50`)
mean(genomes$`Scaffold N50`)

install.packages("ggplot2")
library("ggplot2")
ggplot(data=genomes,aes(x=`Order`,y=log10_N50,fill=`Order`)) + geom_boxplot(varwidth = TRUE) + geom_point(col = "black") +
  labs(x="insect orders",y="log10(N50)",title="Contiguities of Insect Assembled Genomes") + theme_classic()+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(size = 10, color = "black",vjust = 0.5, hjust = 0.5, angle = 45)) +
  theme(axis.title.x = element_text(size = 15, face = "bold")) +
  theme(axis.title.y = element_text(size = 15, face = "bold")) +
  theme(title = element_text(size = 18, face = "bold")) 
