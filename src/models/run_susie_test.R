suppressMessages(library(susieR))

# load in genotype and gene expression datasets for susieR
genotype <- read.table('data/out/fam118a_genotype_test.txt')
expression <- read.table('data/out/fam118a_expression_test.txt')

# run univariate regression using susieR
sumstats <- univariate_regression(genotype, expression[,1])
z.scores <- sumstats$betahat / sumstats$sebetahat
susie_plot(z.scores, y = "z")

# run fine-mapping with susieR
genotype <- as(as.matrix(genotype), 'sparseMatrix')
fitted <- susie(genotype, expression[,1], L = 10, verbose = TRUE)

#plot fine-mapped results
susie_plot(fitted, y="PIP")
