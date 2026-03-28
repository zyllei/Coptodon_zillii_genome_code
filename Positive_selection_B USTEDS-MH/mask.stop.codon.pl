#! /usr/bin/perl -w
use strict;
die "perl $0 <cds-seq>\n" unless @ARGV==1;
my $fa=shift;
open IN,$fa||die;
my %ha;
my $info;
map{chomp;if($_=~/^>(.*)/){$info=$1}else{$ha{$info}.=$_}}<IN>;
close IN;

foreach my $k(sort keys %ha){
	print ">$k\n";
	my($len,$seq);
	if($ha{$k}=~/^[ATCGN-]{6,}/i){
		$len=length($ha{$k});
		for(my $i=0;$i<$len;$i+=3){
			$seq=substr($ha{$k},$i,3);
			if($seq=~/TAA|TGA|TAG/i){
				substr($ha{$k},$i,3)= 'NNN';
			#	warn "delete stop in $i\n";
			}
		}
		print $ha{$k},"\n";	
	}else{print $ha{$k},"\n"; }
}

__END__		
