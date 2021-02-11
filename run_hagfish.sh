## the script is used to run Hagfish - a tool aims to assist in quality control of de novo genome assembly
## Hagfish requires a reference genome and paired end re-sequencing datasets

## Download Hvir PE and MP Illumina data from NCBI
./fastq-dump --defline-seq '@$sn_$ri' --split-files SRA#
## SRA# = SRR5463745, SRR5463746, SRR5514914

## Align the read pairs against the genome, bam output
## using Bowtie2 (2.3.2)
cd ~/Rong/H_vir
## build reference genomes for H_vir, Dovetail, ragout_unsolid, ragout_solid
~/Documents/Programs/bowtie2-2.3.2/bowtie2-build-l -f GCA_002382865.1_K63_refined_pacbio_genomic.fna H_vir
~/Documents/Programs/bowtie2-2.3.2/bowtie2-build-l -f final_assembly.fa Dovetail

## paired-end library SRR5463746
~/Documents/Programs/bowtie2-2.3.2/bowtie2 -x H_vir -1 /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746_1.fastq -2 /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746_2.fastq > /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746.sam

## for mate-paired libraries SRR5514914 and SRR5463745, need to first remove adaptors
## cutadapt script to remove nextera transposase, trim based on quality, and remove 10 bases from the 3'end
cd /media/megan/easystore/Rong/Hvir_data/MP
cutadapt -a CTGTCTCTTATACACATCT -A CTGTCTCTTATACACATCT -o SRR5514914_1_clean.fastq -p SRR5514914_2_clean.fastq SRR5514914_1.fastq SRR5514914_2.fastq -q 30 -u -10 -U -10
cutadapt -a CTGTCTCTTATACACATCT -A CTGTCTCTTATACACATCT -o SRR5463745_1_clean.fastq -p SRR5463745_2_clean.fastq SRR5463745_1.fastq SRR5463745_2.fastq -q 30 -u -10 -U -10

~/Documents/Programs/bowtie2-2.3.2/bowtie2 -x ~/Rong/H_vir/H_vir -1 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_1_clean.fastq -2 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_2_clean.fastq > /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_clean.sam
~/Documents/Programs/bowtie2-2.3.2/bowtie2 -x ~/Rong/H_vir/Dovetail -1 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_1_clean.fastq -2 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_2_clean.fastq > /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_Dovetail_clean.sam
~/Documents/Programs/bowtie2-2.3.2/bowtie2 -x ~/Rong/H_vir/ragout_unsolid -1 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_1_clean.fastq -2 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_2_clean.fastq > /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_ragout_unsolid_clean.sam
~/Documents/Programs/bowtie2-2.3.2/bowtie2 -x ~/Rong/H_vir/ragout_solid -1 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_1_clean.fastq -2 /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_2_clean.fastq > /media/megan/easystore/Rong/Hvir_data/MP/SRR5514914_ragout_solid_clean.sam

## convert sam file to bam file
samtools view -bS SRR5463746.sam -o SRR5463746.bam
## run hagfish_extract to draw histogram of the insert size of paired end library
cd ~/Rong/hagfish
./hagfish_extract /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746.bam -v
## or can directly use the sam file
./hagfish_extract /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746.bam -v -S

## for mate-paired libraries, need to first filter out the contaminated paired end reads
## use SRR5514914_clean.sam as an example
cd /media/megan/easystore/Rong/Hvir_data/MP
head -n 8829 SRR5514914_clean.sam > head.sam
awk '{if ($7 == "=") {print}}' SRR5514914_clean.sam > SRR5514914_clean_1.sam
## filtering according to samFlag, only leave mate-paired reads
awk '{if (($2 == 81) || ($2 == 161) || ($2 ==97) || ($2 == 145)) {print}}' SRR5514914_clean_1.sam > SRR5514914_clean_filter.sam
cat head.sam SRR5514914_clean_filter.sam > SRR5514914_clean_2.sam
## run hagfish_extract to draw the histogram
## samFlag=65: read paired, first in pair
~/Rong/hagfish/hagfish_extract SRR5514914_clean_2.sam -v --samFlag=65 -S
