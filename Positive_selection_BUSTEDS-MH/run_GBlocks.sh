##step1:run GBlocks software##\
mv /05.psg/positive_selection_dir/prank.fa/*out.1.fas /05.psg/positive_selection_dir/prank.out\
ls /05.psg/positive_selection_dir/prank.out/* > /05.psg/positive_selection_dir/all.single.fa.lst\
echo start run GBlocks......at `date +%Y-%m-%d.%H:%M:%S`\
/PSG/software/Gblocks /05.psg/positive_selection_dir/all.single.fa.lst -a=y -c=y w=y  -t=c -e=gb1 -b4=5 -d=y\
echo end run GBlocks at `date +%Y-%m-%d.%H:%M:%S`\
##step2:convert GBlocks file format to paml input fortmat##\
for i in /05.psg/positive_selection_dir/prank.out/*fasgb1; do perl //PSG/psg/gblock2paml.pl $i > $i.paml;done\
cat /05.psg/positive_selection_dir/prank.out/*paml >05.psg/positive_selection_dir/all.paml.fa\
echo obtain the first positive selection input file "all.paml.fa" at `date +%Y-%m-%d.%H:%M:%S`
