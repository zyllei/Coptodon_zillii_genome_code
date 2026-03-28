#!/bin/bash
cat NR/longest.pep.fa.cut/*blast.nr > NR/longest.pep.fa.blast.nr && \ 
perl blast_m7_parser.pl NR/longest.pep.fa.blast.nr NR/longest.pep.fa.blast.nr.xls && \ 
perl blast_nr_class.pl -nr NR/longest.pep.fa.blast.nr.xls -outdir NR
