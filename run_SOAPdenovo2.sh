## I used this script to run SOAPdenovo2, version 2.04
## Different parameters K and M were tried, where K means K-mer length in De Bruijn graph and M is the mergelevel, the strength of merging similar sequences during continging (Default=1)
cd ~/data
mkdir Kmer23
mkdir Kmer33
mkdir Kmer37
mkdir Kmer39/M1
mkdir Kmer39/M2
mkdir Kmer39/M3
mkdir Kmer41
mkdir Kmer41/M1
mkdir Kmer41/M2
mkdir Kmer41/M3
mkdir Kmer43
mkdir Kmer43/M1
mkdir Kmer43/M2
mkdir Kmer43/M3
mkdir Kmer47
mkdir Kmer53
mkdir Kmer63
mkdir Kmer73
mkdir Kmer83
mkdir Kmer97
mkdir Kmer107
mkdir Kmer117
cd ~/data/SOAPdenovo2
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 23 -R -o ~/data/Kmer23/graph_23 1>~/data/Kmer23/ass.log 2>~/data/Kmer23/ass.err 
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 33 -R -o ~/data/Kmer33/graph_33 1>~/data/Kmer33/ass.log 2>~/data/Kmer33/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 37 -R -o ~/data/Kmer37/graph_37 1>~/data/Kmer37/ass.log 2>~/data/Kmer37/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 39 -R -o ~/data/Kmer39/M1/graph_391 1>~/data/Kmer39/M1/ass.log 2>~/data/Kmer39/M1/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 39 -R -M 2 -o ~/data/Kmer39/M2/graph_392 1>~/data/Kmer39/M2/ass.log 2>~/data/Kmer39/M2/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 39 -R -M 3 -o ~/data/Kmer39/M3/graph_393 1>~/data/Kmer39/M3/ass.log 2>~/data/Kmer39/M3/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 41 -R -o ~/data/Kmer41/graph_41 1>~/data/Kmer41/ass.log 2>~/data/Kmer41/ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 41 -R -M 2 -o M2/graph_41 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 41 -R -M 3 -o M3/graph_41 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 43 -R -o graph_43 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 43 -R -M 2 -o M2/graph_43 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 43 -R -M 3 -o M3/graph_43 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 47 -R -o graph_47 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 53 -R -o graph_53 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 63 -R -o graph_63 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 73 -R -o graph_73 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 83 -R -o graph_83 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 97 -R -o graph_97 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 107 -R -o graph_107 1>ass.log 2>ass.err
./SOAPdenovo-127mer all -s ../soap.contig.txt -p 48 -K 117 -R -o graph_117 1>ass.log 2>ass.err
