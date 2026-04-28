bin/hisat2 -p 16 --sensitive -I 1 -X 1000 ./ref_genome.fa -1 ./short_reads_RNA_1.clean.fq.gz -2 short_reads_RNA_2.clean.fq.gz 2>short_reads_RNA_mapstat.xls  | /share/app/samtools-1.9/bin/samtools view -b -S -o short_reads_RNA.bam -\
/share/app/samtools-1.9/bin/samtools sort short_reads_RNA.bam -o short_reads_RNA.sort\
/dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/envs/Augustus3.5/bin/stringtie short_reads_RNA.sort -o short_reads_RNA.gtf -p 8}
