{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25700\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 bin/hisat2 -p 16 --sensitive -I 1 -X 1000 ./ref_genome.fa -1 ./short_reads_RNA_1.clean.fq.gz -2 short_reads_RNA_2.clean.fq.gz 2>short_reads_RNA_mapstat.xls  | /share/app/samtools-1.9/bin/samtools view -b -S -o short_reads_RNA.bam -\
 /share/app/samtools-1.9/bin/samtools sort short_reads_RNA.bam -o short_reads_RNA.sort\
 /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/envs/Augustus3.5/bin/stringtie short_reads_RNA.sort -o short_reads_RNA.gtf -p 8}