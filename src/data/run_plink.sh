# plink commands necessary to process .vcf data for eQTL analysis 
plink --vcf /home/kguruvay/teams/dsc-180a---a17-\[96427\]/1kgp.chr22.GRCh38.30coverage.phased.vcf.gz \
      --biallelic-only \
      --maf 0.05 \
      --out data/temp/plink \
      --make-bed
      
plink --bfile data/temp/plink \
      --recode A \
      --out data/temp/plink
