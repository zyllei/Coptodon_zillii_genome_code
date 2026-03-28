{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 reference=$PWD/reference\
species=luo\
transcript=all.ccs.fa\
cpu=10\
output_format=gff3_gene\
output_name=gmap.gff\
\
/dellfsqd2/ST_OCEAN/USER/lishuo1/01_software/gmap-2023-05-15/bin/gmap -D $reference -d $\{species\}_reference -t $cpu --suboptimal-score=0.9 -f $output_format $transcript > $output_name}