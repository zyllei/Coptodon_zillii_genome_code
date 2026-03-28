#!/usr/bin/env perl -w
use strict;
die "perl draw4GO.pl <GO.result[.difkegg.filt.merg]><prefix><output directory><top number>" unless @ARGV==4;
my $in=shift;
my $p=shift;
my $output=shift;
my $top=shift;
my $out="$output/source4kegg.top$top";
open IN,$in;
open OUT,">$out";
print OUT "pathway_term\trich_factor\tqvalue\tgene_number\n";
my %hash;
<IN>;
while(<IN>){
	chomp;
	my @a=split /\t/,$_;
	$a[1]=~s/\'//;
	my $r=$a[4]/$a[5];
	my $line=$a[1]."\t".$r."\t".$a[3]."\t".$a[4]."\n";
	$hash{$line}=$a[4];
}
my $i=0;
foreach(sort {$hash{$b}<=>$hash{$a}} keys %hash){
	$i++;
	if($i<=$top){
		print OUT $_;
	}
}

my $R="/dellfsqd1/ST_OCEAN/ST_OCEAN/USRS/zhangyaolei/zyllei/enrich/bin/KEGG.Pathwayscatter.R";
my $rscript="/share/app/R-3.4.1/bin/Rscript";
print "$rscript $R $p $output $out\n";
system("$rscript $R $p $output $out");
`rm Rplots.pdf`;

$R="/dellfsqd1/ST_OCEAN/ST_OCEAN/USRS/zhangyaolei/zyllei/enrich/bin/KEGG.Pathwaybar.R";
print "$rscript $R $p $output $out\n";
system("$rscript $R $p $output $out");
`rm Rplots.pdf`;
