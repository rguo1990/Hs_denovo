## the script was used to estimate the genome sizes of H.virescens and H.subflexa, by k-mer occurrence distributions of Illumina short reads.

## Quality control
## sickle
## a minimum Phred-scaled quality value of 25 was required for estimation
sickle pe –f /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746_1.fastq –r /media/megan/easystore/Rong/Hvir_data/PE/SRR5463746_2.fastq –t sanger –o /media/megan/easystore/Rong/Hvir_data/Hvir_PE_1.fastq –p /media/megan/easystore/Rong/Hvir_data/Hvir_PE_2.fastq –q 25 –s /media/megan/easystore/Rong/Hvir_data/Hvir_PE_singles.fastq

## Count k-mer occurrence using Jellyfish 2.2.10
## k=19
jellyfish count -t 16 -C -m 19 -s 8G -o 19mer_out /media/megan/easystore/Rong/Hvir_data/Hvir_PE_1.fastq /media/megan/easystore/Rong/Hvir_data/Hvir_PE_2.fastq 
jellyfish histo -o 19mer_out.histo 19mer_out
