{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25700\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 perl /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/opt/transdecoder/util/gtf_genome_to_cdna_fasta.pl ./stringtie_merged.gtf ./ref_genome.fa >merged_stringtie_transdecoder.fa\
/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/bin/TransDecoder.LongOrfs -t merged_stringtie_transdecoder.fa\
/share/app/ncbi-blast-2.2.31+/bin/blastp -query merged_stringtie_transdecoder.fa.transdecoder_dir/longest_orfs.pep -db /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Database/SwissProt/release20221012/uniprot_sprot.fasta -max_target_seqs 6 -outfmt 6 -evalue 1e-5 -num_threads 48 > blastp.outfmt6\
/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/opt/transdecoder/util/gtf_to_alignment_gff3.pl ./stringtie_merged.gtf >stringtie_merged.gff3\
/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/bin/TransDecoder.Predict -t merged_stringtie_transdecoder.fa --retain_blastp_hits blastp.outfmt6\
/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/opt/transdecoder/util/cdna_alignment_orf_to_genome_orf.pl merged_stringtie_transdecoder.fa.transdecoder.gff3 stringtie_merged.gff3 merged_stringtie_transdecoder.fa >stringtie_transdecoder_genome.gff3}