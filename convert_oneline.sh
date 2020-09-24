## the command is used to convert fasta format from multiple line to one line

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Rong/Ragout/output_unsolid/Hvir_ragout2_unsolid.fasta > ~/Rong/Ragout/output_unsolid/Hvir_ragout_unsolid_oneline.fasta | sed -i 1d

