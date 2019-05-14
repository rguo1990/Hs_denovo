## Haplomerger2 script - run Haplomerger2 to collapse redundant haploids

## First use winMasker to soft-mask the diploid assembly - easier and faster to run without prior knowledge of repetitive sequences

## run_winMasker
## create the reusable masking library
cd winMasker
./windowmasker -mk_counts -in ../../output/genome/SOAP.scafSeq -out masking_library.ustat

## use the masking library to soft-mask the genome assembly
./windowmasker -ustat masking_library.ustat -in ../../output/genome/SOAP.scafSeq -out SOAP.fa -outfmt fasta -dust true

## cleaning up the fasta sequences by using faDnaPolishing.pl (recommended in the manual)
gzip SOAP.fa
cd ../bin
gunzip –c ../winMasker/SOAP.fa.gz | perl faDnaPolishing.pl --legalizing --maskShortPortion=1 --noLeadingN --removeShortSeq=1 > ../SOAP_cleaned.fa
cd ..
gzip SOAP_cleaned.fa

## run Haplomerger2 using script run_all.batch
cd ../project_template
cp ../SOAP_cleaned.fa.gz .
sh run_all.batch

