## L_RNA_scaffolder script - run L_RNA_scaffolder to further scaffold the genome by RNA-seq data
## Using public available RNA-seq data of H.sub: SRR6417879, SRR6417881, SRR6417883, ERR738599 - ERR738602

## download RNA-seq data from NCBI by SRA_toolkit
./fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-files SRA#(such as SRR6417879)

## compile forward/reverse files
cat *_1.fastq > R1.fastq
cat *_2.fastq > R2.fastq

## run trinity to de novo assemble the transcriptome by downloaded RNA-seq data 
cd ~/Rong/trinityrnaseq-Trinity-v2.8.3
./Trinity --seqType fq --max_memory 18G --trimmomatic --CPU 4 --left /media/megan/Elements2/RNA-seq_Data/R1.fastq --right /media/megan/Elements2/RNA-seq_Data/R2.fastq --normalize_reads --verbose --min_contig_length 500 --no_version_check --output /media/megan/Elements2/RNA-seq_Data/trinity/

## run blat mapping the Hsub assembly to the transcriptome
blat -t=dna ~/Downloads/SOAP_cleaned_A_ref_D.fa -q=rna /media/megan/Elements2/RNA-seq_Data/trinity/Trinity.fasta /media/megan/Elements2/RNA-seq_Data/blat_output/output.psl -noHead

## L_RNA_scaffolder
cd ~/Rong/L_RNA_scaffolder/L_RNA_scaffolder/
./L_RNA_scaffolder.sh -d . -i /media/megan/Elements2/RNA-seq_Data/blat_output/output.psl -o /media/megan/Elements2/RNA-seq_Data/genome/ -j ~/Downloads/SOAP_cleaned_A_ref_D.fa
