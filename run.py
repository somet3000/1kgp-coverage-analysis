#!/usr/bin/env python

import sys
import json
import os

def main(targets=['test']):
    
    # implement data target (get data)
    if 'all' in targets:
        
        print('running main target!')
        
        print('downloading liftover information!')
        os.system('bash src/data/download_liftover.sh')

        print('running plink preprocessing!')
        os.system('bash src/features/run_plink.sh')
        
        print('making eqtl matrices!')
        os.system('Rscript src/features/create_genotype_matrix.R')
        os.system('Rscript src/features/create_expression_matrix.R')
        os.system('Rscript src/features/create_gene_and_snp_info.R')
        
        print('running analysis using matrix eQTL!')
        os.system('Rscript src/models/population_model.R')
        
        print('output pdf available in home code directory!')
        
    if 'test' in targets:
        
        print('running test target!')
        
        print('downloading liftover information!')
        os.system('bash src/data/download_liftover.sh')

        print('running plink preprocessing!')
        os.system('bash src/features/run_plink_test.sh')
        
        print('making eqtl matrices!')
        os.system('Rscript src/features/create_genotype_matrix_test.R')
        os.system('Rscript src/features/create_expression_matrix_test.R')
        
        print('running mock analysis using matrix eqtl!')
        os.system('Rscript src/models/population_model_test.R')
        
        print('making fine-mapping data')
        os.system('Rscript src/features/create_fam118a_fine_mapping_test.R')

        print('running fine-mapping!')
        os.system('Rscript src/models/run_susie_test.R')

        print('output pdf available in home code directory!')

if __name__ == '__main__':
    targets = sys.argv[1:]
    main(targets)
