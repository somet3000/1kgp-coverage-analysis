# 1KGP Coverage Analysis
Expression quantitative trait loci (eQTL) and fine-mapping analysis of a cohort from the 1000 Genomes Project using both lower coverage and higher coverage (30x) data.

The raw VCF data can be obtained from the 1000 Genomes Project: https://www.internationalgenome.org/data

The gene expression data can be obtained from the BioStudies website for the RNA-sequencing 1KGP paper: https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-GEUV-1/sdrf?full=true

The analysis is a little bit different when running on at-scale versus test data, leading to different files between them. To run this code on the test data: ```python run.py test```. To run this code on the real data: ```python run.py all```.

This repository uses plink (https://www.cog-genomics.org/plink/1.9/), Matrix eQTL (http://www.bios.unc.edu/research/genomic_software/Matrix_eQTL/), susieR (https://github.com/stephenslab/susieR), and UCSC LiftOver (https://genome.ucsc.edu/cgi-bin/hgLiftOver). Check them out! 

Thanks for stopping by this repository! :)

