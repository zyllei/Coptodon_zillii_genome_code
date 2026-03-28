{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 source activate /dellfsqd2/ST_OCEAN/USER/wangjiahao/My_file/miniconda3/envs/merqury\
mq="/dellfsqd2/ST_OCEAN/USER/wangjiahao/My_file/miniconda3/envs/merqury/share/merqury"\
k=21\
gzip -dc m64066_230102_000448.clean.fasta.gz m64067_221228_021855.clean.fasta.gz  > input.fa\
meryl k=21 memory=50G threads=10 count output hifi.meryl input.fa\
merqury.sh hifi.meryl genome.fa luofei.out}