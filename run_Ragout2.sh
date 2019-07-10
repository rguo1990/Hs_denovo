## the script was used to run Ragout2, a chromosome-level scaffolding using multiple references
## the program was used to further extend scaffolds of published Hvir genome here
## multiple whole-genome alignment was done by SibeliaZ

## for sibeliaZ the sequence header of input fasta files should be in format: >genome.chromosome.#
awk '/^>/ {print ">Hvir.scaffold." ++i; next} {print}' < Hvir_softmask.fasta > Hvir_relabel_geno.chr.fasta
awk '/^>/ {print ">Hzea.scaffold." ++i; next} {print}' < Hzea_softmask.fasta > Hzea_relabel_geno.chr.fasta
awk '/^>/ {print ">Harm.scaffold." ++i; next} {print}' < Harm_softmask.fasta > Harm_relabel_geno.chr.fasta
awk '/^>/ {print ">Hsub.scaffold." ++i; next} {print}' < H.sub_2000_softmask.fasta > Hsub_relabel_geno.chr.fasta
## run sibeliaZ, results saved in sibeliaz_out
cd ~/Rong/SibeliaZ/SibeliaZ/SibeliaZ-LCB/bin
./sibeliaz -f 30 ~/Rong/Ragout/Hsub_relabel_geno.chr.fasta ~/Rong/Ragout/Hvir_relabel_geno.chr.fasta ~/Rong/Ragout/Hzea_relabel_geno.chr.fasta ~/Rong/Ragout/Harm_relabel_geno.chr.fasta

## to use Ragout2, the sequence header of input fasta files should be in a simple format: >chromosome.#
awk '/^>/ {print ">scaffold." ++i; next} {print}' < Hvir_softmask.fasta > Hvir_relabel.fasta
awk '/^>/ {print ">scaffold." ++i; next} {print}' < Hzea_softmask.fasta > Hzea_relabel.fasta
awk '/^>/ {print ">scaffold." ++i; next} {print}' < Harm_softmask.fasta > Harm_relabel.fasta
awk '/^>/ {print ">scaffold." ++i; next} {print}' < H.sub_2000_softmask.fasta > Hsub_relabel.fasta
## these re-labeled files are used as inputs in Ragout2, recipe file

## run Ragout2
cd ~/Rong/Ragout/Ragout/bin
./ragout -s maf -t 8 -o ../../output_unsolid ../../recipe_file.txt
./ragout -s maf --solid-scaffolds -t 8 -o ../../output ../../recipe_file.txt
