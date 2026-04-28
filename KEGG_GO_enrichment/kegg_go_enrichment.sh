perl /enrich/bin/EnrichPipeline.pl --cls KEGG --Rpath /share/app/R-3.4.1/bin/R --mapGene ./gene.map --supplyF ./expan.gene.list --TestMethod FisherChiSquare --P_Adjust_Method fdr --pc 0.05 --outDir ./expan_KEGG_Enrich\
perl /enrich/bin/draw4KEGG.pl ./expan_KEGG_Enrich/*.difkegg.filt Copzi ./expan_KEGG_Enrich 20\
perl /enrich/bin/EnrichPipeline.pl --cls GO --Rpath /Software/Miniconda3/miniconda3/bin/R --GOdata  ./GOdata.RData  --supplyF ./expan.gene.list --TestMethod  FisherChiSquare --P_Adjust_Method fdr -pc 0.05  --outDir ./expan_GO\
perl /enrich/bin/draw4GO.pl ./expan_GO/*.difgoall.filt.merg Copzi ./expan_GO/ 20\
