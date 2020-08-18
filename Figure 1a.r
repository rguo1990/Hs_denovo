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
ggplot(data=d,aes(x=`Order`,y=log10_N50,fill=`Order`)) + geom_boxplot(varwidth = TRUE)+stat_boxplot(geom="errorbar",width=0.15,aes(color=`Order`)) +
  labs(x="insect orders",y="log10(N50)",title="Contiguities of Insect Assembled Genomes") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))
