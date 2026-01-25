dir=$(pwd)

#########
plink=XX/software/variation/plink_1.9/plink
snpDir=XX/14.151-killer-whales/00.data
#geno maf
$plink --noweb --file $snpDir/luofei.snp --geno 0.05 --maf 0.005 --make-bed --out luofei.snp_QC
#LD
$plink --bfile luofei.snp_QC --indep-pairwise 50 5 0.2 --out pruned
$plink --bfile luofei.snp_QC --extract pruned.prune.in --make-bed --out luofei.snp_QC_ld
#PCA
$plink --bfile luofei.snp_QC_ld --make-rel --pca 3 --out luofei.snp_QC_ld_pca
