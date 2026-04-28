source activate /dellfsqd2/ST_OCEAN/USER/wangjiahao/My_file/miniconda3/envs/merqury\
mq="/dellfsqd2/ST_OCEAN/USER/wangjiahao/My_file/miniconda3/envs/merqury/share/merqury"\
k=21\
gzip -dc m64066_230102_000448.clean.fasta.gz m64067_221228_021855.clean.fasta.gz  > input.fa\
meryl k=21 memory=50G threads=10 count output hifi.meryl input.fa\
merqury.sh hifi.meryl genome.fa luofei.out}
