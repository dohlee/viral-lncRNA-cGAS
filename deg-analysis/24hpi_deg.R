library(DESeq2)
library(tximport)

# samples = c('WT-1_6', 'WT-2_6', 'D49-1_6', 'D49-2_6')
samples = c('WT-1_24', 'WT-2_24', 'D49-1_24', 'D49-2_24')

files = file.path('result/03_rsem', paste0(samples, '.genes.results'))

txi = tximport(files, type='rsem', txIn=FALSE, txOut=FALSE)

condition = factor(c('WT', 'WT', 'D49', 'D49'))
sample_table = data.frame(condition=condition)
rownames(sample_table) = colnames(txi$counts)

txi$length[txi$length == 0] = 1
dds = DESeqDataSetFromTximport(txi, sample_table, ~condition)

count_threshold = 4
keep = rowSums(counts(dds)) >= count_threshold
dds = dds[keep,]

dds = DESeq(dds)
res = results(dds, alpha=0.05)

write.csv(res, '24hpi_degs.csv')
