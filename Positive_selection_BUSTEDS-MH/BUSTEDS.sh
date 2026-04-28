source /dellfsqd2/C_OCEAN/USERS/wangchaoyi/myconda/etc/profile.d/conda.sh\
conda activate hyphy_mamba\
hyphy busted --alignment hhh.fasta --tree in.tree --srv Yes --multiple-hits Double+Triple --branches Foreground --output hhh_MH.json
