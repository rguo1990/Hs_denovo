## the script was used to make macrosynteny analysis for all super-scaffolded assemblies with B. mori

~/Rong/MUMmer/MUMmer3.23/promer --mum ~/Rong/Ragout/output_Hsub_unsolid_2/Hsub_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/MUMmer3.23/mummerplot -t png --layout (--fat) -R reference.fasta -Q query.fasta out.delta --large

