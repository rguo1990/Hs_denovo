def main():
    ## Hs_sequences.txt: change it with the query sequences
    file_1="Hs_sequences.txt"
    f1=open(file_1,"r")
    d1=make_dic(f1)
    file_2="R1.fasta"
    file_3="R2.fasta"
    line_list=d1.keys()
    for line_1 in line_list:
        line_2=d1[line_1]
        i=0
        j=0
        f2=open(file_2,"r")
        line1 = f2.readline()
        while line1:
            if line1[0]!='>':
                if line_1 in line1 or line_2 in line1:
                    i=i+1
            line1=f2.readline()
            
        print line_1,i

        f3=open(file_3,"r")
        line2 = f3.readline()
        while line2:
            if line2[0]!='>':
                if line_1 in line2 or line_2 in line2:
                    j=j+1
            line2=f3.readline()
            
        print line_1,j
    f1.close()
    f2.close()
    f3.close()

## build a dictionary with keys = original sequences,
## values = complementary sequences
def make_dic(f):
    d={}
    line = f.readline()
    while line:
    ## skip the lines start with #
        if line[0]!='>':
            line_1=line[:-1]
            line_2=line_1[::-1]
            d[line_1]=line_2
        line = f.readline()
    return d


if __name__ == "__main__":
    main()
