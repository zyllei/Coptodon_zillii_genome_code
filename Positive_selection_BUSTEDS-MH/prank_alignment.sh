{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25700\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ##step1:obtain single ortholog sequences##\
perl /PSG/psg/grep_prank_seq.pl  output/all_vs_all.blast.m8.solar.forHC.hcluster.single-copy /00.data/all.cds /05.psg/positive_selection_dir/prank.fa\
##step2:mask the stop codon bases##\
echo mask the stop codon start at `date +%Y-%m-%d.%H:%M:%S`!\
for i in /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/luofeiyu/01.evoulution/05.psg/positive_selection_dir/prank.fa/*fa; do perl /PSG/psg/mask.stop.codon.pl $i > $i.1;done\
echo mask the stop codon end at `date +%Y-%m-%d.%H:%M:%S`!\
##step3:obtain prank alignments run shell##\
for i in /dellfsqd2/ST_OCEAN/USER/zhangyaolei/Project/luofeiyu/01.evoulution/05.psg/positive_selection_dir/prank.fa/*fa.1; do echo "/PSG/software/prank +F -codon -d=$i -o=$i.out;echo done!" ;done >./05.psg/positive_selection_dir/prank.batch.sh\
##step4:batch qsub the prank alignment jobs##\
echo start prank alignments......at `date +%Y-%m-%d.%H:%M:%S`\
perl ./qsub-sge.pl ./05.psg/positive_selection_dir/prank.batch.sh -reqsub -queue st.q  -lines  1   --maxjob 100 --cpu_num 1  -resource vf=0.5G  -pro_code P18H19700N0038 -convert no -jobprefix work\
echo end prank alignments at `date +%Y-%m-%d.%H:%M:%S`}