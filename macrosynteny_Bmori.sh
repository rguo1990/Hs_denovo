## the script was used to make macrosynteny analysis for all super-scaffolded assemblies with B. mori

cd /media/megan/easystore/Rong/Hsub_genome_assembly/macrosynteny_Bmori

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hsub_unsolid_2/Hsub_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Hsub_unsolid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Hsub_unsolid_Bmori.delta -p Hsub_unsolid_Bmori --large -R Hsub_ragout_unsolid.fasta -Q chromosome.fa

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hsub_solid/Hsub_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Hsub_solid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Hsub_solid_Bmori.delta -p Hsub_solid_Bmori --large -R Hsub_ragout_solid.fasta -Q chromosome.fa

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hzea_unsolid/Hzea_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Hzea_unsolid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Hzea_unsolid_Bmori.delta -p Hzea_unsolid_Bmori --large -R Hzea_ragout_unsolid.fasta -Q chromosome.fa

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Hzea_solid/Hzea_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Hzea_solid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Hzea_solid_Bmori.delta -p Hzea_solid_Bmori --large -R Hzea_ragout_solid.fasta -Q chromosome.fa

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Harm_unsolid/Harm_ragout_unsolid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Harm_unsolid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Harm_unsolid_Bmori.delta -p Harm_unsolid_Bmori --large -R Harm_ragout_unsolid.fasta -Q chromosome.fa

~/Rong/MUMmer/mummer-4.0.0beta5/promer_test --mum --mincluster=200 ~/Rong/Ragout/output_Harm_solid/Harm_ragout_solid.fasta ~/Rong/H_vir/Bmori/chromosome.fa -p Harm_solid_Bmori
~/Rong/MUMmer/mummer-4.0.0beta5/mummerplot -t png --fat Harm_solid_Bmori.delta -p Harm_solid_Bmori --large -R Harm_ragout_solid.fasta -Q chromosome.fa


