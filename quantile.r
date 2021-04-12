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
## above 0.367 = 36.78%
## contiguity of old H.subflexa assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(264374)
## above 0.4597 = 45.98%

## contiguity of new solid H.subflexa assembly
## percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(1151925)
## above 0.6896552 = 68.97%

## contiguity of new unsolid H.subflexa assembly
## percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(14750927)
## above 0.9655172 = 96.55%

## contiguity of new solid H.zea assembly
## percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(6726222)
## above 0.8390805 = 83.91%

## completeness of new solid/unsolid H.zea assembly
percentile <- ecdf(lepidoptera$C)
percentile(1320)
## above 0.7356322 = 73.56%
percentile(1318)
## above 0.7241379 = 72.41%

## contiguity of new unsolid H.zea assembly
percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(9920875)
## above 0.908046 = 90.80%

## contiguity of new solid H.armigera assembly
## percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(6491608)
## above 0.8390805 = 83.91%

## contiguity of new unsolid H.armigera assembly
## percentile <- ecdf(lepidoptera$`Scaffold N50`)
percentile(8775610)
## above 0.8505747 = 85.06%

## completeness of new solid/unsolid H.armigera assembly
percentile <- ecdf(lepidoptera$C)
percentile(1330)
## above 0.7586207 = 75.86%
percentile(1328)
## above 0.7471264 = 74.71%

