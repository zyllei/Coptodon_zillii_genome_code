{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww24560\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
data=luofei/02.gemoma/00.data\
/dellfsqd2/ST_OCEAN/USER/liuxiaochuan/bin/jdk1.8.0_191/bin/java -jar /dellfsqd2/ST_OCEAN/USER/liuxiaochuan/bin/gemoma/GeMoMa-1.6.4.jar CLI GeMoMaPipeline threads=8 t=ref_genome.fa s=own i=OA a=$data/Oreochromis_aureus.gff g=$data/Oreochromis_aureus.genome.fa s=own i=ON a=$data/O_niloticus.gff g=$data/O_niloticus.genome.fa s=own i=SM a=$data/Sarotherodon_melanotheron.gff g=$data/Sarotherodon_melanotheron.genome.fa s=own i=AC a=$data/Archocentrus_centrarchus.gff g=$data/Archocentrus_centrarchus.genome.fa s=own i=HB a=$data/Haplochromis_burtoni.gff g=$data/Haplochromis_burtoni.genome.fa s=own i=EC a=$data/Etheostoma_cragini.gff g=$data/Etheostoma_craginigenome.fa s=own i=PF a=$data/Perca_flavescens.gff g=$data/Perca_flavescens.genome.fa s=own i=PFL a=$data/P_fluviatilis.gff g=$data/P_fluviatilis.genome.fa  s=own i=DR a=$data/Danio_rerio.gff g=$data/Danio_rerio.genome.fa  s=own i=OL a=$data/Oryzias_latipes.gff g=$data/Oryzias_latipes.genome.fa  tblastn=false outdir=out_put AnnotationFinalizer.r=NO}