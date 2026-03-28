#!/bin/bash
cat KEGG/longest.pep.fa.cut/*blast.kegg > KEGG/longest.pep.fa.blast.kegg && \
perl /get_annot_info.pl -tophit 5 -topmatch 1 -id /database/kegg/RNA/106.0/animal.id.annot.xls -input KEGG/longest.pep.fa.blast.kegg -out KEGG/longest.pep.fa.blast.kegg.xls && \
perl bin/03.gene_function//blast2ko.pl -input BC_CBG_PAP/F23A040010099-01/ANIexusD/LSG/13.homolog/merge/pasa/upload/longest.pep.fa -output KEGG/longest.pep.fa.ko -blastout KEGG/longest.pep.fa.blast.kegg -kegg     /database/kegg/RNA/106.0/animal.fa && \
perl bin/03.gene_function//pathfind.pl -kegg /database/kegg/RNA/106.0/animal.fa -maptitle /database/kegg/RNA/106.0/map_title.tab -komap /database/kegg/RNA/106.0/komap/animal_ko_map.tab -fg KEGG/longest.pep.fa.ko -output KEGG/longest.pep.fa.path && \
if [ -d KEGG/longest.pep.fa_map ]; then rm -rf KEGG/longest.pep.fa_map ; fi && \
mkdir -p KEGG/longest.pep.fa_map && \
perl bin/03.gene_function//keggMap_nodiff.pl -komap /database/kegg/RNA/106.0/komap/animal_ko_map.tab -mapdir /database/kegg/RNA/106.0/map -ko KEGG/longest.pep.fa.ko -outdir KEGG/longest.pep.fa_map && \
perl bin/03.gene_function//genPathHTML.pl -indir KEGG
perl bin/03.gene_function//unigene.drawKEGG.pl -path KEGG/longest.pep.fa.path -outprefix KEGG/longest.pep.fa -idCol 3 -level1Col 4 -level2Col 5 -geneCol 6
