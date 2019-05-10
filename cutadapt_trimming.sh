## cutadapt script - trimming sequencing data used in the H.sub genome assembly 

## Paired-end library: Truseq Index Adapter 19 (GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTGAAACGATCTCGTATGCCGTCTTCTGCTTG)
cd /media/megan/Elements2/Hsub_annotation/DNAseq_RawSeq/PE/
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o L001_R1_trimmed.fastq -p L001_R2_trimmed.fastq L001_R1.fastq L001_R2.fastq --minimum-length 10
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o L002_R1_trimmed.fastq -p L002_R2_trimmed.fastq L002_R1.fastq L002_R2.fastq --minimum-length 10

## Mate-paired library: Nextera Adapter (CTGTCTCTTATACACATCT+AGATGTGTATAAGAGACAG)
## Independently assesses each adapter for trimming
cd ../MP/
cutadapt -a CTGTCTCTTATACACATCT -A AGATGTGTATAAGAGACAG -o 2KB_R1_1.fastq -p 2KB_R2_1.fastq 2KB_R1.fastq 2KB_R2.fastq --minimum-length 10
cutadapt -a AGATGTGTATAAGAGACAG -A CTGTCTCTTATACACATCT -o 2KB_R1_1_2.fastq -p 2KB_R2_1_2.fastq 2KB_R1_1.fastq 2KB_R2_1.fastq --minimum-length 10
cutadapt -a CTGTCTCTTATACACATCT -A AGATGTGTATAAGAGACAG -o 5KB_R1_1.fastq -p 5KB_R2_1.fastq 5KB_R1.fastq 5KB_R2.fastq --minimum-length 10
cutadapt -a AGATGTGTATAAGAGACAG -A CTGTCTCTTATACACATCT -o 5KB_R1_1_2.fastq -p 5KB_R2_1_2.fastq 5KB_R1_1.fastq 5KB_R2_1.fastq --minimum-length 10
    					      

