reference=$PWD/reference\
species=luo\
transcript=all.ccs.fa\
cpu=10\
output_format=gff3_gene\
output_name=gmap.gff\
\
/dellfsqd2/ST_OCEAN/USER/lishuo1/01_software/gmap-2023-05-15/bin/gmap -D $reference -d $\{species\}_reference -t $cpu --suboptimal-score=0.9 -f $output_format $transcript > $output_name
