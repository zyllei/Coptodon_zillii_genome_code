{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 unset PYTHONPATH\
source activate /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/envs/busco6\
\
busco --offline \\\
  -l /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Database/busco6/lineages/actinopterygii_odb12/ \\\
  -m genome/gene \\\
  -c 5 \\\
  -i ./genome.fa \\\
  -o genome_output/gene_out:}