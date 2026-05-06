library(clusterProfiler)
require(DOSE)
data(geneList)
gene <- names(geneList)[abs(geneList) > 2]
ggo <- groupGO(gene = gene, OrgDb="org.Hs.eg.db", ont = "CC",level = 3, readable = TRUE)

head(summary(ggo))
write.csv(ggo,file="result.ggo.xls")

ego <- enrichGO(gene = gene, universe = names(geneList),OrgDb="org.Hs.eg.db", ont = "CC", pvalueCutoff = 0.01,readable = TRUE)
head(summary(ego))
write.csv(ego,file="result.ego.xls")

ego2 <- gseGO(geneList = geneList, OrgDb="org.Hs.eg.db",ont = "CC", nPerm = 100, minGSSize = 120, pvalueCutoff = 0.01,verbose = FALSE)
head(summary(ego2))
write.csv(ego,file="result.ego2.xls")
barplot(ggo, drop = TRUE, showCategory = 12)

barplot(ego, showCategory = 8)

#as.vector(as.character(t(a)))