# plink commands necessary to process .vcf data for eQTL analysis 
plink --vcf test/testdata/test_chr22.vcf.gz \
      --biallelic-only \
      --maf 0.05 \
      --out data/temp/plink_test \
      --make-bed
      
plink --bfile data/temp/plink_test \
      --recode A \
      --out data/temp/plink_test