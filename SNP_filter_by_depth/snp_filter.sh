vcftools-v0.1.16/bin/vcftools --vcf luofei_snp_chr.vcf --site-mean-depth\
vcftools --vcf luofei_snp_chr.vcf --min-meanDP 5 --max-meanDP 29 --recode --out filtered_95CI
