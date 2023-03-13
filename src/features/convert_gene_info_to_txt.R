gene.info <- read.table('data/out/high_coverage/hg38_gene_info.bed')
colnames(gene.info) <- c('chr', 'left', 'right', 'geneid')
gene.info <- gene.info[, c('geneid', 'chr', 'left', 'right')]
gene.info$chr <- substr(gene.info$chr, 4, nchar(gene.info$chr))
write.table(gene.info, 'data/out/high_coverage/gene_info.txt', quote = FALSE)

gene.info <- read.table('data/out/low_coverage/hg38_gene_info.bed')
colnames(gene.info) <- c('chr', 'left', 'right', 'geneid')
gene.info <- gene.info[, c('geneid', 'chr', 'left', 'right')]
gene.info$chr <- substr(gene.info$chr, 4, nchar(gene.info$chr))
write.table(gene.info, 'data/out/low_coverage/gene_info.txt', quote = FALSE)