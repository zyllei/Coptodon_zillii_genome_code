#!/bin/bash
cat Swissprot/longest.pep.fa.cut/*blast.swissprot > Swissprot/longest.pep.fa.blast.swissprot && \ 
perl get_annot_info.pl -tophit 5 -topmatch 1 -id database/uniprot/swissport/uniprot_sprot.Eukaryota.id.annot.xls -input Swissprot/longest.pep.fa.blast.swissprot -out Swissprot/longest.pep.fa.blast.swissprot.xls
