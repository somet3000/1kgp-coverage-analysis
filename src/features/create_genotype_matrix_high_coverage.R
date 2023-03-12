# read in plink output
print('reading in snp data')
snp.data <- read.table(
    'data/temp/high_coverage/plink.raw',
    header = TRUE,
    nrows = 500,
    colClasses = c('character', 'character', rep('integer', 101231))
)

rownames(snp.data) <- snp.data$IID
snp.data <- snp.data[, 7:ncol(snp.data)]
snp.data <- t(snp.data)

rownames(snp.data) <- lapply(rownames(snp.data), function(x) {strsplit(x, '_')[[1]][1]})

# read in RNA-seq gene expression data
rnaseq.data <- read.table(
    '/home/kguruvay/teams/dsc-180a---a17-[96427]/1kgp.rnaseq.genequantRPKM.txt.gz',
    header = TRUE,
    nrows = 1,
    colClasses = c('character', 'character', 'character', 'integer', rep('numeric', 462))
)

rownames(rnaseq.data) <- rnaseq.data$Gene_Symbol
rnaseq.data <- rnaseq.data[, 5:ncol(rnaseq.data)]
rnaseq.samples <- colnames(rnaseq.data)
snp.data <- snp.data[, colnames(snp.data) %in% rnaseq.samples]

write.table(snp.data, quote=FALSE, 'data/out/high_coverage/matrix_eqtl_genotype_data.txt')
