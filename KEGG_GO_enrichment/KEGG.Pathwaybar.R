
args <-commandArgs(TRUE);##sampleName ##output dir ##identify file
#rm(list = ls())
library(ggplot2)
path=read.table(args[3],sep="\t",header=T)
colnames(path)<-c("Pathway_term","Rich_factor","qvalue","Gene_number")
p<-ggplot(path, aes(Pathway_term,Rich_factor))
p<-p+geom_bar(aes(fill=qvalue),stat="identity")+coord_flip()+scale_colour_gradientn(colours=rainbow(4),guide = "colourbar")+expand_limits(color=seq(0, 1, by=0.25))
p<-p+ggtitle("Statistics of Enrichment") + xlab("") +ylab("Rich_factor")
p<-p+theme_bw()+theme(axis.text=element_text( color="black", size=10))
p<-p+theme(panel.border=element_rect(colour = "black"))
p<-p+theme(plot.title=element_text(vjust=1), legend.key=element_blank())
p<- p+ scale_fill_gradientn(colours = rainbow(4))

ggsave(paste(args[2],"/",args[1],".","Enriched_pathway_bar.png",sep=""), plot=p,type="cairo-png", width=8, height=7, dpi=700)
ggsave(paste(args[2],"/",args[1],".","Enriched_pathway_bar.pdf",sep=""), plot=p, width=8, height=7)
