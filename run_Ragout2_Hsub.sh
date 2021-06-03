## the script was used to run Ragout2, a chromosome-level scaffolding using multiple references
## the program Ragout2 was used to further extend scaffolds of new Hsub assembly
## multiple whole-genome alignment was done by SibeliaZ

## softmask the Hvir_Dovetail assembly by windowmasker
## create a reusable masking library
/home/megan/Rong/HaploMerger2/HaploMerger2_20180603/winMasker/windowmasker -mk_counts -in ~/Rong/Ragout/final_assembly.fa -out ~/Rong/Ragout/masking_library_HvirDovetail.ustat

## use the masking_library to soft mask the genome assembly
/home/megan/Rong/HaploMerger2/HaploMerger2_20180603/winMasker/windowmasker -ustat ~/Rong/Ragout/masking_library_HvirDovetail.ustat -in ~/Rong/Ragout/final_assembly.fa -out ~/Rong/Ragout/Hvir_Dovetail_softmask.fasta -outfmt fasta -dust true

## for sibeliaZ the sequence header of input fasta files should be in format: >genome.chromosome.#
cd ~/Rong/Ragout/
awk '/^>/ {print ">Hvir.scaffold." ++i; next} {print}' < Hvir_Dovetail_softmask.fasta > Hvir_Dovetail_relabel_geno.chr.fasta

cd ~/Rong/SibeliaZ/SibeliaZ/SibeliaZ-LCB/bin
./sibeliaz -f 30 ~/Rong/Ragout/Hsub_relabel_geno.chr.fasta ~/Rong/Ragout/Hvir_Dovetail_relabel_geno.chr.fasta ~/Rong/Ragout/Hzea_relabel_geno.chr.fasta ~/Rong/Ragout/Harm_relabel_geno.chr.fasta
## results are saved in ~/Rong/SibeliaZ/SibeliaZ/SibeliaZ-LCB/bin/sibeliaz_out_Hsub

## to use Ragout2, the sequence header of input fasta files should be in a simple format: >chromosome.#
awk '/^>/ {print ">scaffold." ++i; next} {print}' < Hvir_Dovetail_softmask.fasta > Hvir_Dovetail_relabel.fasta

## the re-labeled files: Hvir_Dovetail_relabel.fasta, Hzea_relabel.fasta, Harm_relabel.fasta, Hsub_relabel.fasta
## are used as inputs in Ragout2, recipe file

## run Ragout2
cd ~/Rong/Ragout/Ragout/bin
./ragout -s maf -t 8 -o ../../output_Hsub_unsolid ../../recipe_file_Hsub.txt
./ragout -s maf --solid-scaffolds -t 8 -o ../../output_Hsub_solid ../../recipe_file_Hsub.txt
