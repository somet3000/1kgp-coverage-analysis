# read in RNA-seq matrix
rnaseq.data <- read.table('data/out/matrix_eqtl_phenotype_test.txt')

# isolate gene expression for FAM118A gene
fam118a.id <- 'ENSG00000249263.2'
fam118a.expr <- rnaseq.data[fam118a.id, ]

# save gene expression values to a .txt file in susieR format
fam118a.expr <- t(fam118a.expr)
write.table(fam118a.expr, 'data/out/fam118a_expression_test.txt')

# read in SNP info and gene info files
#snp.info <- read.table('data/out/snp_info_test.txt', header=TRUE)
#gene.info <- read.table('data/out/gene_info_test.txt', header=TRUE)

# get coordinate for fam118a gene
#fam118a.coord <- gene.info[gene.info$geneid == fam118a.id, 'left']

# get all candidate snps
#candidate.snps <- snp.info[abs(snp.info$pos - fam118a.coord) < 500000, ]

# read in genotype matrix
genotype.data <- read.table('data/out/matrix_eqtl_genotype_data_test.txt')

# filter to only include genotypes for candidate snps
#genotype.data <- genotype.data[rownames(genotype.data) %in% candidate.snps$snpid, ]
genotype.data <- t(genotype.data)
write.table(genotype.data, 'data/out/fam118a_genotype_test.txt')
