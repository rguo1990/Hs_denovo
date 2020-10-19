## The script is used to run MUMmer-4.0.0beta2
## draw synteny dotplots to measure the similarities and differences between two assemblies

## run nucmer - a perl script for alignment of multiple closely related nucleotide sequences
cd ~/Rong/MUMmer/mummer-4.0.0beta2/
./nucmer --mum --mincluster 200 --maxgap 300 assembly1.fasta assembly2.fasta
## --mum use anchor matches that are unique in both ref & qry
## --mincluster minimum cluster length (default=65)
## --maxgap maximum gaps between two adjacent matches in a cluster
## output is *.delta file - an encoded representation of the all-all alignment between ref vs. qry

## display summary info such as position, percent identity ... of each alignment
./show-coords out.delta > out.coords

## draw the synteny dotplot
./mummerplot -t png --layout (--fat) -R reference.fasta -Q query.fasta out.delta --large

## blue: reverse matches, purple: forward matches
