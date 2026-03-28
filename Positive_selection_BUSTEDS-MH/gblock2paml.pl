#! /usr/bin/perl -w
use strict;
use File::Basename;
die "perl $0 fagb\n" unless @ARGV==1;
my $gb=shift;
open IN,$gb||die;

my $name=(split/\./,basename($gb))[0];
my @out;
print ">$name\n";
$/=">";<IN>;$/="\n";
while(<IN>){
	my $info=$1 if(/(.+)/);
	$/=">";
	my $seq=<IN>;
	$/="\n";
	$seq=~s/>|\n|\s+//g;
	my $a=join "\t",$info,$seq;
	push @out,$a;
}
close IN;
my @sort_out=map{$_->[0]}
		sort{$a->[1] cmp $b->[1]}
		map{[$_,(split/_/,(split)[0])[-1]]}@out; ## sort the output sequeces by suffix ,this step is necessary for paml ananlysis
foreach(@sort_out){
	$_=~s/\t/\n/;
	print $_,"\n";
}
	
