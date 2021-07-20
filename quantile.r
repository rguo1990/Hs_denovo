## R script to calculate the quantile of assembly's contiguity (N50) and completeness
lepidoptera <- readxl::read_excel("/Users/rongguo/UMD/Hs_denovo/writing/Manuscript/Table S2.xlsx",skip = 1,
                                  col_types = c("text", "text", "text","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric",
                                                "numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
## completeness of old H.subflexa assembly
sort(lepidoptera$`C (%)`)
length(lepidoptera$`C (%)`)
## 87
percentile <- ecdf(lepidoptera$`C (%)`)
percentile(0.908)
1-32/87
## above 0.3678 = 36.78%
## contiguity of old H.subflexa assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(264374)
## above 0.4597 = 45.98%

## contiguity of new solid H.subflexa assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(1335006)
## above 0.7011494 = 70.11%

## contiguity of new unsolid H.subflexa assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(16413121)
## above 0.9885057 = 98.85%

## contiguity of new solid H.zea assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(6100690)
## above 0.8275862 = 82.76%

## completeness of new solid/unsolid H.zea assembly
percentile <- ecdf(lepidoptera$C)
percentile(1320)
## above 0.7356322 = 73.56%
percentile(1317)
## above 0.7126437 = 71.26%

## contiguity of new unsolid H.zea assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(8865798)
## above 0.862069 = 86.21%

## contiguity of new solid H.armigera assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(9477009)
## above 0.8965517 = 89.66%

## contiguity of new unsolid H.armigera assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(9240022)
## above 0.8965517 = 89.66%

## completeness of new solid/unsolid H.armigera assembly
percentile <- ecdf(lepidoptera$C)
percentile(1332)
## above 0.7816092 = 78.16%
percentile(1328)
## above 0.7471264 = 74.71%

sub_1<-lepidoptera$`Total Genome Size`[lepidoptera$`Total Genome Size` >=300000000]
length(sub_1[sub_1<=500000000])


