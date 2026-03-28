{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25700\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do mkdir -p $i/$j;echo \'93./miniprot --gff ./luofeiyu/05.OR/$i.genome.fa ./luofeiyu/05.OR/$j.pep.fa -t 5 -P $j > `pwd`/$i/$j/$i.$j.miniprot.gff";done;done > miniprot.sh\
qsubsge --resource vf=5g,p=2 -maxjob 50 --reqsub miniprot.sh &\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do awk '$3=="mRNA" || $3=="CDS"' $i/$j/$i.$j.miniprot.gff |awk -v FS=";" '\{print $1";"\}' > $i/$j/$i.$j.bgi.gff; done; done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do cd ./luofeiyu/05.OR/$i/$j/;nr_gff $i.$j.bgi.gff;done ;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do perl Bin/script_perl/gff_deal/std_add_delete_rename_intron_gff.pl -rename -prefix $i $i/$j/$i.$j.bgi.gff.nr.gff >$i/$j/$i.$j.bgi.gff.nr.rename.gff;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do getGen.pl $i/$j/$i.$j.bgi.gff.nr.rename.gff $i.genome.fa >$i/$j/$i.$j.bgi.gff.nr.rename.cds;cds2aa $i/$j/$i.$j.bgi.gff.nr.rename.cds >$i/$j/$i.$j.bgi.gff.nr.rename.pep;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do length $i/$j/$i.$j.bgi.gff.nr.rename.pep $i/$j/$i.$j.bgi.gff.nr.rename.pep.len;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in OR;do awk '$2>200' $i/$j/$i.$j.bgi.gff.nr.rename.pep.len >$i/$j/$i.$j.bgi.gff.nr.rename.pep.len.flt;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7;do awk '$2>100' $i/$j/$i.$j.bgi.gff.nr.rename.pep.len >$i/$j/$i.$j.bgi.gff.nr.rename.pep.len.flt;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in CLR;do awk '$2>100' $i/$j/$i.$j.bgi.gff.nr.rename.pep.len >$i/$j/$i.$j.bgi.gff.nr.rename.pep.len.flt;done;done\
for i in C.zillii D.rerio O.latipes G.aculeatus O.niloticus O.aureus;do for j in B7 OR CLR;do fishInWinter.pl -bf table -ff fasta $i/$j/$i.$j.bgi.gff.nr.rename.pep.len.flt $i/$j/$i.$j.bgi.gff.nr.rename.pep >$i/$j/$i.$j.bgi.gff.nr.rename.pep.flt;done;done}