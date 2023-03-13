gene.info <- read.table('data/out/high_coverage/gene_info.txt', header=TRUE)
gene.info <- gene.info[, c('chr', 'left', 'right', 'geneid')]
gene.info$chr <- paste0('chr', gene.info$chr)

# write to bed file
write.table(gene.info, 'data/out/high_coverage/hg37_gene_info.bed', row.names = FALSE, col.names = FALSE, quote = FALSE, sep = '\t')

gene.info <- read.table('data/out/low_coverage/gene_info.txt', header=TRUE)
gene.info <- gene.info[, c('chr', 'left', 'right', 'geneid')]
gene.info$chr <- paste0('chr', gene.info$chr)

# write to bed file
write.table(gene.info, 'data/out/low_coverage/hg37_gene_info.bed', row.names = FALSE, col.names = FALSE, quote = FALSE, sep = '\t')


