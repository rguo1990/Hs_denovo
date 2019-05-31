## L_RNA_scaffolder script - run L_RNA_scaffolder to further scaffold the genome by RNA-seq data
## Using public available RNA-seq data of H.sub: SRR6417879, SRR6417881, SRR6417883, ERR738599 - ERR738602
## Among them, SRR6417879 was extracted from H.sub adult female antennae
## SRR6417881 was extracted from H.sub adult male and female thorax
## SRR6417883 was extracted from H.sub adult male antennae
## ERR738599 - ERR738602 were extracted from H.sub gut

## download RNA-seq data from NCBI by SRA_toolkit (version 2.9.2)
./fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-files SRA#(such as SRR6417879)

## compile forward/reverse files if necessary
cat *_1.fastq > R1.fastq
cat *_2.fastq > R2.fastq

## create folders for different transcriptomes and the new assemblies
mkdir trinity_gut
mkdir trinity_thorax
mkdir SPAdes_maleAntennae
mkdir SPAdes_femaleAntennae
mkdir genome_gut
mkdir genome_thorax
mkdir genome_maleAntennae
mkdir genome_femaleAntennae

## run L_RNA_scaffolder iteratively with different datasets (from gut, thorax, male antennae and female antennae)
## run trinity (v.2.8.3) to de novo assemble the transcriptome by RNA-seq data from gut 
~/Rong/trinityrnaseq-Trinity-v2.8.3/Trinity --seqType fq --max_memory 18G --trimmomatic --CPU 4 --left /media/megan/Elements2/RNA-seq_Data/R1.fastq --right /media/megan/Elements2/RNA-seq_Data/R2.fastq --normalize_reads --verbose --min_contig_length 500 --no_version_check --output /media/megan/Elements2/RNA-seq_Data/trinity_gut/

## run blat mapping the Hsub assembly to the transcriptome of gut
blat -t=dna /media/megan/easystore/Rong/Hsub_genome_assembly/SOAP_cleaned_A_ref_D.fa -q=rna /media/megan/Elements2/RNA-seq_Data/trinity_gut/Trinity.fasta /media/megan/Elements2/RNA-seq_Data/blat_output/output_gut.psl -noHead

## L_RNA_scaffolder
~/Rong/L_RNA_scaffolder/L_RNA_scaffolder/L_RNA_scaffolder.sh -d . -i /media/megan/Elements2/RNA-seq_Data/blat_output/output_gut.psl -o /media/megan/Elements2/RNA-seq_Data/genome_gut/ -j /media/megan/easystore/Rong/Hsub_genome_assembly/SOAP_cleaned_A_ref_D.fa

## scaffold the new assembly by RNA-seq data from thorax
~/Rong/trinityrnaseq-Trinity-v2.8.3/Trinity --seqType fq --max_memory 18G --trimmomatic --CPU 4 --left /media/megan/Elements2/RNA-seq_Data/SRR6417881_1.fastq --right /media/megan/Elements2/RNA-seq_Data/SRR6417881_2.fastq --normalize_reads --verbose --min_contig_length 500 --no_version_check --output /media/megan/Elements2/RNA-seq_Data/trinity_thorax/

blat -t=dna /media/megan/Elements2/RNA-seq_Data/genome_gut/L_RNA_scaffolder.fasta -q=rna /media/megan/Elements2/RNA-seq_Data/trinity_thorax/Trinity.fasta /media/megan/Elements2/RNA-seq_Data/blat_output/output_thorax.psl -noHead

~/Rong/L_RNA_scaffolder/L_RNA_scaffolder/L_RNA_scaffolder.sh -d . -i /media/megan/Elements2/RNA-seq_Data/blat_output/output_thorax.psl -o /media/megan/Elements2/RNA-seq_Data/genome_thorax/ -j /media/megan/Elements2/RNA-seq_Data/genome_gut/L_RNA_scaffolder.fasta

## scaffold the new assembly by RNA-seq data from male antennae
## run rnaSPAdes to de novo assemble the transcriptome of male antennae
python ~/Rong/SPAdes-3.12.0-Linux/bin/spades.py --rna -1 /media/megan/Elements2/RNA-seq_Data/SRR6417883_1.fastq -2 /media/megan/Elements2/RNA-seq_Data/SRR6417883_2.fastq -o /media/megan/Elements2/RNA-seq_Data/SPAdes_maleAntennae/

blat -t=dna /media/megan/Elements2/RNA-seq_Data/genome_thorax/L_RNA_scaffolder.fasta -q=rna /media/megan/Elements2/RNA-seq_Data/SPAdes_maleAntennae/hard_filtered_transcripts.fasta /media/megan/Elements2/RNA-seq_Data/blat_output/output_maleAntennae.psl -noHead

~/Rong/L_RNA_scaffolder/L_RNA_scaffolder/L_RNA_scaffolder.sh -d . -i /media/megan/Elements2/RNA-seq_Data/blat_output/output_maleAntennae.psl -o /media/megan/Elements2/RNA-seq_Data/genome_maleAntennae/ -j /media/megan/Elements2/RNA-seq_Data/genome_thorax/L_RNA_scaffolder.fasta

## further scaffold the new assembly by RNA-seq data from female antennae
python ~/Rong/SPAdes-3.12.0-Linux/bin/spades.py --rna -1 /media/megan/Elements2/RNA-seq_Data/SRR6417879_1.fastq -2 /media/megan/Elements2/RNA-seq_Data/SRR6417879_2.fastq -o /media/megan/Elements2/RNA-seq_Data/SPAdes_femaleAntennae/

blat -t=dna /media/megan/Elements2/RNA-seq_Data/genome_maleAntennae/L_RNA_scaffolder.fasta -q=rna /media/megan/Elements2/RNA-seq_Data/SPAdes_femaleAntennae/hard_filtered_transcripts.fasta /media/megan/Elements2/RNA-seq_Data/blat_output/output_femaleAntennae.psl -noHead

~/Rong/L_RNA_scaffolder/L_RNA_scaffolder/L_RNA_scaffolder.sh -d . -i /media/megan/Elements2/RNA-seq_Data/blat_output/output_femaleAntennae.psl -o /media/megan/Elements2/RNA-seq_Data/genome_femaleAntennae/ -j /media/megan/Elements2/RNA-seq_Data/genome_maleAntennae/L_RNA_scaffolder.fasta


