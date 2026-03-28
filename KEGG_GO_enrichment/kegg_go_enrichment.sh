{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww24240\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 perl /enrich/bin/EnrichPipeline.pl --cls KEGG --Rpath /share/app/R-3.4.1/bin/R --mapGene ./gene.map --supplyF ./expan.gene.list --TestMethod FisherChiSquare --P_Adjust_Method fdr --pc 0.05 --outDir ./expan_KEGG_Enrich\
perl /enrich/bin/draw4KEGG.pl ./expan_KEGG_Enrich/*.difkegg.filt Copzi ./expan_KEGG_Enrich 20\
perl /enrich/bin/EnrichPipeline.pl --cls GO --Rpath /Software/Miniconda3/miniconda3/bin/R --GOdata  ./GOdata.RData  --supplyF ./expan.gene.list --TestMethod  FisherChiSquare --P_Adjust_Method fdr -pc 0.05  --outDir ./expan_GO\
perl /enrich/bin/draw4GO.pl ./expan_GO/*.difgoall.filt.merg Copzi ./expan_GO/ 20\
}