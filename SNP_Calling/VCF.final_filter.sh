# SNP hard filter
/dellfsqd2/ST_OCEAN/USER/wangyue2/lib/java1.8/bin/java -jar /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar VariantFiltration -R ./ref_genome.fa --variant luo.snp.vcf -O luo.snp.filter.vcf --filter-expression "QD < 2.0 || MQ < 40.0 || FS > 60.0 || ReadPosRankSum < -8.0 || MQRankSum < -12.5" --filter-name LowQualFilter

# SNP filter by the depth 95% CI
vcftools --vcf luo.snp.filter.vcf --site-mean-depth
vcftools --vcf luo.snp.filter.vcf --min-meanDP 5 --max-meanDP 29 --recode --out filtered_95CI

# SNP filter by the MAF and missing data
vcftools --vcf filtered_95CI.recode.vcf --max-missing 0.95 --maf 0.01 --recode --recode-INFO-all --out filtered_95CI.QC 
