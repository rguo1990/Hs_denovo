## the script was used to make macrosynteny analysis for all super-scaffolded assemblies with B. mori

cd /media/megan/easystore/Rong/Hsub_genome_assembly/macrosynteny_Bmori

~/Rong/MUMmer/MUMmer3.23/promer --mum ~/Rong/Ragout/output_Hsub_unsolid_2/Hsub_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/MUMmer3.23/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/MUMmer3.23/promer --mum ~/Rong/Ragout/output_Hsub_solid_2/Hsub_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/MUMmer3.23/mummerplot -t png --fat out.delta --large


