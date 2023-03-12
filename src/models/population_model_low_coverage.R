suppressMessages(library(MatrixEQTL))

useModel = modelLINEAR
SNP_file_name = 'data/out/low_coverage/matrix_eqtl_genotype_data.txt'
expression_file_name = 'data/out/low_coverage/matrix_eqtl_phenotype.txt'
covariates_file_name = character()
output_file_name = 'data/out/low_coverage_output.txt'

pvOutputThreshold = 1e-2
errorCovariance = numeric()

snps = SlicedData$new()
snps$fileDelimiter = " "
snps$fileOmitCharacters = "NA"
snps$fileSkipRows = 1
snps$fileSkipColumns = 1
snps$fileSliceSize = 2000
snps$LoadFile(SNP_file_name)

gene = SlicedData$new()
gene$fileDelimiter = " "
gene$fileOmitCharacters = "NA"
gene$fileSkipRows = 1
gene$fileSkipColumns = 1
gene$fileSliceSize = 2000
gene$LoadFile(expression_file_name)

genes <- read.table('data/out/low_coverage/gene_info.txt', header = TRUE)
snp.df <- read.table('data/out/low_coverage/snp_info.txt', header = TRUE)
snp.df$pos <- as.integer(snp.df$pos)

me = Matrix_eQTL_main(
    snps = snps,
    gene = gene,
    genepos = genes,
    snpspos = snp.df,
    cisDist = 500000,
    pvOutputThreshold.cis = 5e-8,
    pvOutputThreshold = 0,
#     cvrt = cvrt,
    output_file_name.cis = output_file_name,
    useModel = useModel,
    errorCovariance = errorCovariance,
    verbose = TRUE,
    pvalue.hist = 'qqplot',
    min.pv.by.genesnp = FALSE,
    noFDRsaveMemory = FALSE
)

pdf('output_qqplot_low_coverage.pdf')
plot(me)
dev.off()
