{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww21900\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 source activate /dellfsqd2/ST_OCEAN/USER/wangjiahao/My_file/miniconda3/envs/python38\
for i in `cat ccs.lst`; do samtools fastq $i; done | gzip > ccs.fq.gz\
isoquant.py --reference luofei.genome.fa --data_type pacbio_ccs --threads 10 --fastq ccs.fq.gz\
#cat OUT.transcript_models.gtf|perl -e 'while(<>)\{chomp;my@aa=split/\\t/,$_;next if($aa[2]eq"gene");$aa[8]=~/transcript_id \\"([^\\"]+)\\"/;if($aa[2]eq"transcript")\{$aa[2]="mRNA";$aa[8]="ID=$1;";\}if($aa[2]eq"exon")\{$aa[2]="CDS";$aa[8]="Parent=$1;";\}my$line=join("\\t",@aa);print"$line\\n";\}' > OUT.transcript_models.gff}