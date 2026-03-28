#! /usr/bin/perl -w
use strict;
die "perl $0 <all_vs_all.blast.m8.solar.forHC.hcluster.single-copy><all.cds><DIR>\n" unless @ARGV==3;
my ($cp,$cds,$dir)=@ARGV;
open IN,$cp||die;
my %ha;
while(<IN>){
	chomp;
	my $fam=(split)[0];
	my @spe=split/,/,(split)[-1];
	push @{$ha{$fam}},@spe;
}
close IN;

mkdir $dir,0755 if(! -e $dir);
open IN,$cds||die;
my %out;
$/=">";<IN>;$/=">";
while(<IN>){	
	my $info=$1 if(/^(\S+)/);
	$/=">";
	my $seq=<IN>;
	$/="\n";
	$seq=~s/>//;
	$out{$info}=$seq;
}
close IN;

foreach my $k(sort{$a<=>$b} keys %ha){
	my @p=@{$ha{$k}};
	my @sort_p=map{$_->[0]}
			sort{$a->[-1] cmp $b->[-1]}
			map{[$_,split/_/]}@p;
	my $fa_name=$k.".fa";
	my $lst_name=$k.".lst";
	open OUT,">$dir/$fa_name"||die;
	open OUT2,">$dir/$lst_name"||die;
	foreach my $gene (@sort_p){
			print OUT ">$gene\n$out{$gene}"  if(exists $out{$gene});
			print OUT2 "$gene\n";
	}
	close OUT;
	close OUT2;
}	

__DATA__
