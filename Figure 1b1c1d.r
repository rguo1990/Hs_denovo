## a script to plot Figure 1b, 1c, 1d

lepidoptera <- readxl::read_excel("/Users/rongguo/UMD/Hs_denovo/writing/Manuscript/Table S2.xlsx",skip = 1,
                                  col_types = c("text", "text", "text","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric",
                                                "numeric","numeric","numeric","numeric","numeric"))
max(lepidoptera$`Scaffold N50`)
min(lepidoptera$`Scaffold N50`)
mean(lepidoptera$`Scaffold N50`)
median(lepidoptera$`Scaffold N50`)
max(lepidoptera$`Total Genome Size`)
min(lepidoptera$`Total Genome Size`)

ratio <- lepidoptera$`Total Genome Size`/lepidoptera$`Scaffold N50`
lepidoptera_log10 <- log10(lepidoptera$`Scaffold N50`)

## plot figure 1b -- contiguities of Lepidopteran assembled genomes
ggplot(data=lepidoptera,aes(x=`Family`,y=lepidoptera_log10,fill=`Family`)) + geom_boxplot(varwidth = TRUE) + geom_point(col = "black") +
  labs(x="Lepidoptera families",y="log10(N50)",title="Contiguities of Lepidopteran Assembled Genomes") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5)) 
  
## plot figure 1c -- N50 vs. Total Genome Size
ggplot(data=lepidoptera,aes(x=`Total Genome Size`,y=lepidoptera_log10,col=Family)) + geom_point() +
  labs(x="Total Genome Size",y="log10(N50)",title="N50 vs. Total Genome Size") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))
  
## the range of completeness
min(lepidoptera$`C (%)`)
max(lepidoptera$`C (%)`)
mean(lepidoptera$`C (%)`)
median(lepidoptera$`C (%)`)

## plot figure 1d -- completeness of Lepidopteran assembled genomes
ggplot(data=lepidoptera,aes(x=Family,y=`C (%)`,fill=`Family`)) + geom_boxplot(varwidth = TRUE) + geom_point(col="black") +
  labs(x="Lepidoptera families",y="Completeness (%)",title="Completeness of Lepidopteran Assembled Genomes") + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))
