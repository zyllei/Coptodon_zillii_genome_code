unset PYTHONPATH\
source activate /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Software/Miniconda3/miniconda3/envs/busco6\
\
busco --offline \\\
  -l /dellfsqd2/ST_OCEAN/USER/zhangyaolei/zyllei/Database/busco6/lineages/actinopterygii_odb12/ \\\
  -m genome/gene \\\
  -c 5 \\\
  -i ./genome.fa \\\
  -o genome_output/gene_out
