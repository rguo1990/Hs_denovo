## I used this script to run SOAPdenovo2, version 2.04
## Different parameters K and M were tried, where K means K-mer length in De Bruijn graph and M is the mergelevel, the strength of merging similar sequences during continging (Default=1)

$ all -s soap.contig.txt -K 23 -R -o graph_23 1>ass.log 2>ass.err 
$ all -s soap.contig.txt -K 33 -R -o graph_33 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 37 -R -o graph_37 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 39 -R -o graph_39 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 39 -R -M 2 -o M2/graph_39 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 39 -R -M 3 -o M3/graph_39 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 41 -R -o graph_41 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 41 -R -M 2 -o M2/graph_41 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 41 -R -M 3 -o M3/graph_41 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 43 -R -o graph_43 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 43 -R -M 2 -o M2/graph_43 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 43 -R -M 3 -o M3/graph_43 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 47 -R -o graph_47 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 53 -R -o graph_53 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 63 -R -o graph_63 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 73 -R -o graph_73 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 83 -R -o graph_83 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 97 -R -o graph_97 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 107 -R -o graph_107 1>ass.log 2>ass.err
$ all -s soap.contig.txt -K 117 -R -o graph_117 1>ass.log 2>ass.err
