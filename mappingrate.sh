## the script was used to align the paired end library SRR5463746 back to the H.virescens assemblies, and calculate mapping back rate

## map the whole data set to the H.virescens assemblies
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_1.fastq -2 SRR5463746_2.fastq -p 15 1> SRR5463746.sam 2> Hvir.report
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_1.fastq -2 SRR5463746_2.fastq -p 15 1> Dovetail.sam 2> Dovetail.report
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_1.fastq -2 SRR5463746_2.fastq -p 15 1> ragout_solid.sam 2> ragout_solid.report
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_1.fastq -2 SRR5463746_2.fastq -p 15 1> ragout_unsolid.sam 2> ragout_unsolid.report


## randomly subset the fastq files into 5 datasets, and each has 10% of the original data
python randomReadSubSample.py -f1 SRR5463746_1.fastq -f2 SRR5463746_2.fastq -n 5 -r 0 -s 0.1 -o SRR5463746_mappingback0.1

## mapping the reads back to the assemblies
## to the published H.virescens assembly
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_mappingback0.1_0.1.fq -2 SRR5463746_mappingback0.1_0.2.fq -p 15 1> mappingback0.1_0.sam 2> mappingback0.1_0.report
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_mappingback0.1_1.1.fq -2 SRR5463746_mappingback0.1_1.2.fq -p 15 1> mappingback0.1_1.sam 2> mappingback0.1_1.report
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_mappingback0.1_2.1.fq -2 SRR5463746_mappingback0.1_2.2.fq -p 15 1> mappingback0.1_2.sam 2> mappingback0.1_2.report
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_mappingback0.1_3.1.fq -2 SRR5463746_mappingback0.1_3.2.fq -p 15 1> mappingback0.1_3.sam 2> mappingback0.1_3.report
bowtie2 -x ~/Rong/H_vir/H_vir -1 SRR5463746_mappingback0.1_4.1.fq -2 SRR5463746_mappingback0.1_4.2.fq -p 15 1> mappingback0.1_4.sam 2> mappingback0.1_4.report

## to the Dovetail assembly
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_mappingback0.1_0.1.fq -2 SRR5463746_mappingback0.1_0.2.fq -p 15 1> mappingback0.1_Dovetail.0.sam 2> mappingback0.1_Dovetail.0.report
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_mappingback0.1_1.1.fq -2 SRR5463746_mappingback0.1_1.2.fq -p 15 1> mappingback0.1_Dovetail.1.sam 2> mappingback0.1_Dovetail.1.report
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_mappingback0.1_2.1.fq -2 SRR5463746_mappingback0.1_2.2.fq -p 15 1> mappingback0.1_Dovetail.2.sam 2> mappingback0.1_Dovetail.2.report
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_mappingback0.1_3.1.fq -2 SRR5463746_mappingback0.1_3.2.fq -p 15 1> mappingback0.1_Dovetail.3.sam 2> mappingback0.1_Dovetail.3.report
bowtie2 -x ~/Rong/H_vir/Dovetail -1 SRR5463746_mappingback0.1_4.1.fq -2 SRR5463746_mappingback0.1_4.2.fq -p 15 1> mappingback0.1_Dovetail.4.sam 2> mappingback0.1_Dovetail.4.report

## to the H.virescens solid assembly
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_mappingback0.1_0.1.fq -2 SRR5463746_mappingback0.1_0.2.fq -p 15 1> mappingback0.1_ragout_solid.0.sam 2> mappingback0.1_ragout_solid.0.report
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_mappingback0.1_1.1.fq -2 SRR5463746_mappingback0.1_1.2.fq -p 15 1> mappingback0.1_ragout_solid.1.sam 2> mappingback0.1_ragout_solid.1.report
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_mappingback0.1_2.1.fq -2 SRR5463746_mappingback0.1_2.2.fq -p 15 1> mappingback0.1_ragout_solid.2.sam 2> mappingback0.1_ragout_solid.2.report
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_mappingback0.1_3.1.fq -2 SRR5463746_mappingback0.1_3.2.fq -p 15 1> mappingback0.1_ragout_solid.3.sam 2> mappingback0.1_ragout_solid.3.report
bowtie2 -x ~/Rong/H_vir/ragout_solid -1 SRR5463746_mappingback0.1_4.1.fq -2 SRR5463746_mappingback0.1_4.2.fq -p 15 1> mappingback0.1_ragout_solid.4.sam 2> mappingback0.1_ragout_solid.4.report

## to the H.virescens unsolid assembly
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_mappingback0.1_0.1.fq -2 SRR5463746_mappingback0.1_0.2.fq -p 15 1> mappingback0.1_ragout_unsolid.0.sam 2> mappingback0.1_ragout_unsolid.0.report
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_mappingback0.1_1.1.fq -2 SRR5463746_mappingback0.1_1.2.fq -p 15 1> mappingback0.1_ragout_unsolid.1.sam 2> mappingback0.1_ragout_unsolid.1.report
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_mappingback0.1_2.1.fq -2 SRR5463746_mappingback0.1_2.2.fq -p 15 1> mappingback0.1_ragout_unsolid.2.sam 2> mappingback0.1_ragout_unsolid.2.report
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_mappingback0.1_3.1.fq -2 SRR5463746_mappingback0.1_3.2.fq -p 15 1> mappingback0.1_ragout_unsolid.3.sam 2> mappingback0.1_ragout_unsolid.3.report
bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 SRR5463746_mappingback0.1_4.1.fq -2 SRR5463746_mappingback0.1_4.2.fq -p 15 1> mappingback0.1_ragout_unsolid.4.sam 2> mappingback0.1_ragout_unsolid.4.report
