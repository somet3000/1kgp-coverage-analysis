
genes <- read.table(
    '/home/kguruvay/teams/dsc-180a---a17-[96427]/1kgp.rnaseq.genequantRPKM.txt.gz',
    header = TRUE,
    nrows = 25000,
    colClasses = c('character', 'character', 'character', 'integer', rep('numeric', 462))
)

genes <- genes[, c('Gene_Symbol', 'Chr', 'Coord')]

colnames(genes) <- c('geneid', 'chr', 'left')
genes$right <- genes$left + 1

print('writing gene info file!')
write.table(genes, 'data/out/low_coverage/gene_info.txt', sep = '\t', row.names = FALSE)

snp.df <- read.table('data/temp/low_coverage/plink.bim', header = FALSE)
snp.df$V2 <- paste(c(snp.df$V1, snp.df$V4, snp.df$V6, snp.df$V5), sep = ':')
snp.df <- snp.df[, c('V1', 'V2', 'V4')]
snp.df <- snp.df[, c('V2', 'V1', 'V4')]
colnames(snp.df) <- c('snpid', 'chr', 'pos')
print(head(snp.df))

# read in genotype matrix
genotype.matrix <- read.table('data/out/low_coverage/matrix_eqtl_genotype_data.txt', row.names = NULL)
print(head(genotype.matrix))
snp.names <- genotype.matrix$row.names
snp.df$snpid <- paste0('X', gsub(':', '.', snp.df$snpid))
print(head(snp.df))
print(head(snp.names))
snp.df <- snp.df[snp.df$snpid %in% snp.names, ]

print('writing snp info file!')
write.table(snp.df, 'data/out/low_coverage/snp_info.txt', sep = '\t', row.names = FALSE)
