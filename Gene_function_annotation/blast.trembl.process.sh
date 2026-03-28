cat Trembl/longest.pep.fa.cut/*blast.trembl > Trembl/longest.pep.fa.blast.trembl && \ 
perl get_annot_info.pl -tophit 5 -topmatch 1 -id database/uniprot/trembl//uniprot_trembl.Eukaryota.id.annot.xls -input Trembl/longest.pep.fa.blast.trembl -out Trembl/longest.pep.fa.blast.trembl.xls
