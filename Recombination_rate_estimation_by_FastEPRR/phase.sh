{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww20440\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 vcftools --vcf filtered_95CI.recode.vcf --keep AF.id --recode --out filtered_95CI_AF\
vcftools --vcf filtered_95CI_AF.recode.vcf   --max-missing 0.95 --maf 0.01 --recode --recode-INFO-all --out filtered_95CI_AF.QC\
vcftools --vcf filtered_95CI_AF.QC.recode.vcf --chr $_ --recode --recode-INFO-all --stdout  >$_.vcf.gz"' >extract.chr.vcf.sh\
ls chr*.vcf | perl -lne 'print "bcftools  view -m2 -M2 -v snps $_ -o $_.bi-allelic.vcf "'\
ls chr*bi-allelic.vcf | perl -lne 'print "export PATH=/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/bin/\\n/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/bin/vcf_phase.py --vcf /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/luofeiyu/review-comments2/ld-hat/fastEPRR/$_ --phase-algorithm shapeit --out-format vcf.gz --out $_.phase.gz   "'}