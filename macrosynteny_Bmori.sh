## the script was used to make macrosynteny analysis for all super-scaffolded assemblies with B. mori

cd /media/megan/easystore/Rong/Hsub_genome_assembly/macrosynteny_Bmori

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hsub_unsolid_2/Hsub_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hsub_solid_2/Hsub_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hzea_unsolid/Hzea_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hzea_solid/Hzea_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Harm_unsolid/Harm_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Harm_solid/Harm_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat out.delta --large


