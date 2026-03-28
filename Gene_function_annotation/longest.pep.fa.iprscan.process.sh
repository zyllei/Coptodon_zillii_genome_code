cat Interpro/longest.pep.fa.cut/*.iprscan > Interpro/longest.pep.fa.iprscan
perl bin/03.gene_function/bin/iprscan_parser_xls.pl Interpro/longest.pep.fa.iprscan Interpro/longest.pep.fa.iprscan.xls
perl bin/03.gene_function/bin/iprscan_parser51-55.pl Interpro/longest.pep.fa.iprscan -outdir Interpro
rm -r Interpro/temp/*
