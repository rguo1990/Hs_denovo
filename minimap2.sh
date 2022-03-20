## the script was used to run minimap2 to detect small introduced inversions or structural errors in the extended assemblies

./minimap2 ~/Rong/H_vir/GCA_002382865.1_K63_refined_pacbio_genomic.fna ~/Rong/H_vir/final_assembly.fa -o Dovetail_2.paf -x asm20
./minimap2 ~/Rong/H_vir/GCA_002382865.1_K63_refined_pacbio_genomic.fna ~/Rong/H_vir/Ragout2/output/Hvir_ragout2_solid.fasta -o Hvir_ragout_solid_2.paf -x asm20
./minimap2 ~/Rong/H_vir/GCA_002382865.1_K63_refined_pacbio_genomic.fna ~/Rong/H_vir/Ragout2/output_unsolid/Hvir_ragout2_unsolid.fasta -o Hvir_ragout_unsolid_2.paf -x asm20
