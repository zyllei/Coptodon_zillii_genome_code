#main steps for using sentieon to call SNP and Indel by population using joint calling method

step1. from fastq to gvcf
sentieon_quickstart_FQtoGVCF.sh
sh sentieon_quickstart_FQtoGVCF.sh /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/ sample1_clean.fq.gz sample1_clean.fq.gz sample1

step2. from gvcf to vcf [optional: you can use by chromosome]
sentieon_quickstart_GVCFtoVCF.sh
sh sentieon_quickstart_GVCFtoVCF.sh /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/02.snp/02.joint_calling/ gvcf.lst 02.snp/02.joint_calling/chr1

step3. [merge raw vcf, sort] split SNP and Indel and get high-quality SNP and Indel
VCF.merge.sort.split.HQ.sh
sh VCF.merge.sort.split.HQ.sh -g /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/ref_genome.fa -v chr_vcf.lst -p luofei -t 10

step4. finally filter for SNP 
VCF.final_filter.sh


