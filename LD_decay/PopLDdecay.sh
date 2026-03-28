{\rtf1\ansi\ansicpg936\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;\f1\fnil\fcharset0 .SFNS-Regular_wdth_opsz110000_GRAD_wght1F40000;}
{\colortbl;\red255\green255\blue255;\red19\green21\blue24;\red255\green255\blue255;\red19\green21\blue24;
}
{\*\expandedcolortbl;;\cssrgb\c9804\c10588\c12157;\cssrgb\c100000\c100000\c100000;\cssrgb\c9804\c10588\c12157;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 ## run \cf4 \cb3 \outl0\strokewidth0 PopLDdecay for each subgroup \cf2 \cb3 \outl0\strokewidth0 \strokec2 \
./bin/PopLDdecay -InVCF luo_snp_chr_QC.recode.vcf -OutStat QDH.stat.gz -SubPop QDH.list\
##then plot\
perl bin/Plot_
\f1 \cf2 \cb3 \strokec2 Multi
\f0 \cf2 \cb3 \strokec2 Pop.pl\'a0
\f1 \cf2 \cb3 \strokec2 -inList
\f0 \cf2 \cb3 \strokec2 \'a0multi.list -output OutputPrefix}