{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25700\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
export PATH=/share/app/samtools-1.9/bin/:/dellfsqd2/ST_OCEAN/USER/hankai/software/Aligner/fasta-36.3.8g/bin:$PATH\
export PATH=/dellfsqd2/ST_OCEAN/USER/liliangwei/softs/gmap/bin/:$PATH\
export PATH=/share/app/gcc-5.2.0/bin:$PATH;export LD_LIBRARY_PATH=/share/app/gcc-5.2.0/lib:/share/app/gcc-5.2.0/lib64:$LD_LIBRARY_PATH\
unset PERL5LIB; export PATH=/dellfsqd2/ST_OCEAN/USER/liliangwei/softs/perl-5.30.2/bin:$PATH\
export PATH=/zfsqd1/ST_OCEAN/USRS/liliangwei/softs/PASApipeline.v2.5.3/bin:$PATH\
\
fa=./ref_genome.fa\
spec=luo\
#perl change_format.pl luo.v0.gff > EVM.all.gff3\
#cat stringtie_transdecoder.fa  > transcripts.fa\
#/dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/gffread-0.9.12.Linux_x86_64/gffread transcripts.gtf -g electric_fish.fa -w transcripts.fa\
\
##### \uc0\u23558 \u36716 \u24405 \u26412 \u25968 \u25454 \u27604 \u23545 \u21040 UniVec\u25968 \u25454 \u24211 \u65292 \u23545 vector\u12289 adaptor\u12289 primer\u31561 \u27745 \u26579 \u24207 \u21015 \u36827 \u34892 \u36807 \u28388 \u25110 \u32773 \u25130 \u30701 \u65292 \u24182 \u19988 \u29983 \u25104 mysql\u25968 \u25454 \u24211 \u21644 \u34920 \
/dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/bin/seqclean transcripts.fa -c 16 -v /dellfsqd2/ST_OCEAN/USER/hankai/database/UniVec/UniVec.fasta\
#touch clean_done\
\
##### \uc0\u36816 \u34892 PASA\u20027 \u31243 \u24207 \u23558 \u36716 \u24405 \u26412 \u24207 \u21015 \u27604 \u23545 \u21040 \u22522 \u22240 \u32452 \u19978 \
#/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/Launch_PASA_pipeline.pl --config alignAssembly.config --create --replace --run --genome $fa --transcripts ./transcripts.fa.clean --ALIGNERS gmap -T -u ./transcripts.fa --CPU 70 --MAX_INTRON_LENGTH 10000000 --ALT_SPLICE\
#touch launch1_done\
\
##### \uc0\u39564 \u35777 GFF3\u25991 \u20214 \u30340 \u20860 \u23481 \u24615 \
/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/misc_utilities/pasa_gff3_validator.pl EVM.all.gff3\
touch check1_done\
\
##### \uc0\u23558 \u22522 \u22240 \u27880 \u37322 \u25991 \u20214 \u19978 \u20256 \u21040 \u25968 \u25454 \u24211 \
/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/scripts/Load_Current_Gene_Annotations.dbi -c alignAssembly.config -g $fa -P EVM.all.gff3\
touch load1_done\
\
##### \uc0\u36816 \u34892 PASA\u20027 \u31243 \u24207 \u65292 \u23558 \u36716 \u24405 \u26412 \u22312 \u22522 \u22240 \u32452 \u19978 \u30340 \u21305 \u37197 \u20449 \u24687 \u21644 \u19978 \u20256 \u30340 \u22522 \u22240 \u32452 \u27880 \u37322 \u20449 \u24687 \u36827 \u34892 \u27604 \u36739 \u65292 \u24182 \u23545 \u22522 \u22240 \u27880 \u37322 \u20449 \u24687 \u36827 \u34892 \u26356 \u26032 \
/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/Launch_PASA_pipeline.pl -c annotCompare.config -g $fa -t ./transcripts.fa.clean -A --CPU 70\
touch launch2_done\
\
#/dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/misc_utilities/gff3_to_gtf_format.pl $spec.sqlite.gene_structures_post_PASA_updates.46082.gff3 $fa > $spec.sqlite.gene_structures_post_PASA_updates.46082.gtf\
#touch first_update_done\
\
############## second update\
#/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/misc_utilities/pasa_gff3_validator.pl $spec.sqlite.gene_structures_post_PASA_updates.46082.gff3\
#touch check2_done\
\
#/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/scripts/Load_Current_Gene_Annotations.dbi -c alignAssembly.config -g $fa -P $spec.sqlite.gene_structures_post_PASA_updates.46082.gff3\
#touch load2_done\
\
#/dellfsqd2/ST_OCEAN/USER/hankai/software/miniconda3/bin/perl /dellfsqd2/ST_OCEAN/USER/hankai/software/Annotation/PASApipeline/Launch_PASA_pipeline.pl -c annotCompare.config -g $fa -t ./transcripts.fa.clean -A --CPU 50\
#touch launch3_done\
\
#touch second_update_done\
#echo "Finished"}