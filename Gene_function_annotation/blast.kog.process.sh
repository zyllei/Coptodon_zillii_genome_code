#!/bin/bash
cat KOG/longest.pep.fa.cut/*blast.kog > KOG/longest.pep.fa.blast.kog && \
perl get_annot_info.pl -tophit 5 -topmatch 1 -id /database/kog/data/kog_clean.fa.id -input KOG/longest.pep.fa.blast.kog -out KOG/longest.pep.fa.blast.kog.xls && \
perl cog_parser.pl /database/kog/data/twog.merge /database/kog/data/fun.txt KOG/longest.pep.fa.blast.kog.xls && \
perl cog_R.pl -catalog KOG/longest.pep.fa.KOG2Gene.xls -sample longest.pep.fa -outdir  KOG
