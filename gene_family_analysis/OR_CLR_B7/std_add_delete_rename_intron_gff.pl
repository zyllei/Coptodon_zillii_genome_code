#!usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my ($add_list_file, $add_gff_file, $delete_list_file, $rename, $prefix, $standardization, $get_intron_gff);
my $Help;

GetOptions(
	"add_list_file:s"=>\$add_list_file,
	"add_gff_file:s"=>\$add_gff_file,
	"delete_list_file:s"=>\$delete_list_file,
	"rename"=>\$rename,
	"prefix:s"=>\$prefix,
	"standardization"=>\$standardization,
	"get_intron_gff"=>\$get_intron_gff,
	"help"=>\$Help
);

die"Usage: perl $0 glean.gff -add_list_file add_file -add_gff_file add_gff > output
       perl $0 glean.gff -add_list_file add_file -add_gff_file add_gff -delete_list_file delete_list > output
       perl $0 glean.gff -add_list_file add_file -add_gff_file add_gff -delete_list_file delete_list -rename -prefix Amel
       perl $0 glean.gff -standardization -add_list_file add_file -add_gff_file add_gff -delete_list_file delete_list -rename -prefix Amel > output
       perl $0 glean.gff -standardization -get_intron_gff > output" if (@ARGV < 1 || $Help);

my $original_gff_fie=shift;

open(ORGFF,$original_gff_fie)||die"$!\n";
my %original_gff; my $last_gene_id;
while(<ORGFF>){
	next if(/^#/);
	chomp;
	my @a=split /\t+/, $_;
	($a[3],$a[4])=($a[4],$a[3]) if($a[3]>$a[4]);
	my $gene_id;
	if($a[2] eq 'mRNA'){
		$gene_id=$1 if($a[8]=~/^ID=(\S+?);/);
		$last_gene_id=$gene_id if(!$last_gene_id || $gene_id gt $last_gene_id);
		push @{$original_gff{$a[0]}{$gene_id}{'mRNA'}},($a[0],$a[1],$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8]);
	}
	elsif($a[2] eq 'CDS'){
		$gene_id=$1 if($a[8]=~/^Parent=(\S+?);/);
		push @{$original_gff{$a[0]}{$gene_id}{'CDS'}},[$a[0],$a[1],$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8]];
	}
}
close ORGFF;


if($standardization){
	foreach my $chr (sort keys %original_gff){
		foreach my $gene (keys %{$original_gff{$chr}}){
			my $s=$original_gff{$chr}{$gene}{'CDS'}->[0][3];
			my $e=$original_gff{$chr}{$gene}{'CDS'}->[0][4];
			foreach my $cds_p (@{$original_gff{$chr}{$gene}{'CDS'}}){
				$s=$cds_p->[3] if($cds_p->[3]<$s);
				$e=$cds_p->[4] if($cds_p->[4]>$e);
			}
			$original_gff{$chr}{$gene}{'mRNA'}->[3]=$s;
			$original_gff{$chr}{$gene}{'mRNA'}->[4]=$e;
		}
	}
}


if($add_list_file && $add_gff_file){
	open(ADDLIST,$add_list_file)||die"$!\n";
	my %add_list;
	while(<ADDLIST>){
		next if(/^#/);
		chomp;
		my @a=split /\t+/, $_;
		$add_list{$a[0]}=1;
	}
	close ADDLIST;

	open(ADDGFF,$add_gff_file)||die"$!\n";
	my ($new_gene_id_pre, $new_gene_id_num, $new_gene_id_num2, $new_gene_id);
	while(<ADDGFF>){
		next if(/^#/);
		chomp;
		my @a=split /\t+/, $_;
		($a[3],$a[4])=($a[4],$a[3]) if($a[3]>$a[4]);
		my $gene_id=$2 if($a[8]=~/(ID|Parent)=(\S+?);/);
		if(exists $add_list{$gene_id}){
			if($last_gene_id=~/^(\D+)(\d+)$/ && $a[2] eq 'mRNA'){
				($new_gene_id_pre, $new_gene_id_num)=($1,$2);
				$new_gene_id_num++;
				$new_gene_id=$new_gene_id_pre.$new_gene_id_num;
				$last_gene_id=$new_gene_id;
			}
			elsif($last_gene_id=~/^(\D+)(\d+)\.(\d+)$/ && $a[2] eq 'mRNA'){
				($new_gene_id_pre, $new_gene_id_num, $new_gene_id_num2)=($1,$2,$3);
				$new_gene_id_num++;
				$new_gene_id=$new_gene_id_pre.$new_gene_id_num.".1";
				$last_gene_id=$new_gene_id;
			}
		 	#"the gene id should be changed to Dnsa000001, Dnsa000001.11, Dnsa_000001 or Dnsa_000001.11\n^(\D+)(\d+)\$ or ^(\D+)(\d+)\.(\d+)\$";
		
			$a[8]=~s/$gene_id/$new_gene_id/g;

			if($a[2] eq 'mRNA'){
				push @{$original_gff{$a[0]}{$gene_id}{'mRNA'}},($a[0],$a[1],$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8]);
			}
			elsif($a[2] eq 'CDS'){
				push @{$original_gff{$a[0]}{$gene_id}{'CDS'}},[$a[0],$a[1],$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8]];
			}
		}
	}
	close ADDGFF;
}

if($delete_list_file){
	open(DELIST,$delete_list_file)||die"$!\n";
	while(<DELIST>){
		chomp;
		my $gene_del=(split /\t+/, $_)[0];
		foreach my $chr (sort keys %original_gff){
			foreach my $gene (keys %{$original_gff{$chr}}){
				if($gene eq $gene_del){
					delete $original_gff{$chr}{$gene};
				}
			}
		}
	}
	close DELIST;
}

if($rename && $prefix){
	my $num='00000';
	foreach my $chr (sort keys %original_gff){
		foreach my $gene (sort {$original_gff{$chr}{$a}{'mRNA'}->[3] <=> $original_gff{$chr}{$b}{'mRNA'}->[3]} keys %{$original_gff{$chr}}){
			$num++;
			my $old_gene_id=$2 if($original_gff{$chr}{$gene}{'mRNA'}->[8]=~/(ID|Parent)=(\S+?);/);
			my $new_gene_id=$prefix.$num;
			$original_gff{$chr}{$gene}{'mRNA'}->[8]=~s/$old_gene_id/$new_gene_id/g;

			foreach my $cds_p (sort {$a->[3] <=> $b->[3]} @{$original_gff{$chr}{$gene}{'CDS'}}){
				$cds_p->[8]=~s/$old_gene_id/$new_gene_id/g;
			}
		}
	}
}



##### print out #####
if(!defined $get_intron_gff){
foreach my $chr (sort keys %original_gff){
	foreach my $gene (sort {$original_gff{$chr}{$a}{'mRNA'}->[3] <=> $original_gff{$chr}{$b}{'mRNA'}->[3]} keys %{$original_gff{$chr}}){
		print "$original_gff{$chr}{$gene}{'mRNA'}->[0]\t$original_gff{$chr}{$gene}{'mRNA'}->[1]\t$original_gff{$chr}{$gene}{'mRNA'}->[2]\t$original_gff{$chr}{$gene}{'mRNA'}->[3]\t$original_gff{$chr}{$gene}{'mRNA'}->[4]\t$original_gff{$chr}{$gene}{'mRNA'}->[5]\t$original_gff{$chr}{$gene}{'mRNA'}->[6]\t$original_gff{$chr}{$gene}{'mRNA'}->[7]\t$original_gff{$chr}{$gene}{'mRNA'}->[8]\n";
		foreach my $cds_p (sort {$a->[3] <=> $b->[3]} @{$original_gff{$chr}{$gene}{'CDS'}}){
			print "$cds_p->[0]\t$cds_p->[1]\t$cds_p->[2]\t$cds_p->[3]\t$cds_p->[4]\t$cds_p->[5]\t$cds_p->[6]\t$cds_p->[7]\t$cds_p->[8]\n";
		}
	}
}
}

if($get_intron_gff){
	foreach my $chr (sort keys %original_gff){
		foreach my $gene (sort {$original_gff{$chr}{$a}{'mRNA'}->[3] <=> $original_gff{$chr}{$b}{'mRNA'}->[3]} keys %{$original_gff{$chr}}){
			next if(@{$original_gff{$chr}{$gene}{'CDS'}}<2);
			my $s=${$original_gff{$chr}{$gene}{'CDS'}}[0][4];
			my $e=${$original_gff{$chr}{$gene}{'CDS'}}[1][3];
			foreach my $cds_p (sort {$a->[3] <=> $b->[3]} @{$original_gff{$chr}{$gene}{'CDS'}}){
				$s=$cds_p->[4] if($cds_p->[4]<$s);
				$e=$cds_p->[3] if($cds_p->[3]>$e);
			}
			print "$original_gff{$chr}{$gene}{'mRNA'}->[0]\t$original_gff{$chr}{$gene}{'mRNA'}->[1]\t$original_gff{$chr}{$gene}{'mRNA'}->[2]\t".($s+1)."\t".($e-1)."\t$original_gff{$chr}{$gene}{'mRNA'}->[5]\t$original_gff{$chr}{$gene}{'mRNA'}->[6]\t$original_gff{$chr}{$gene}{'mRNA'}->[7]\t$original_gff{$chr}{$gene}{'mRNA'}->[8];intron\n";
			my @cds_ps = (sort {$a->[3] <=> $b->[3]} @{$original_gff{$chr}{$gene}{'CDS'}});
			for(my $j=1; $j<=$#cds_ps; $j++){
				print "$cds_ps[$j]->[0]\t$cds_ps[$j]->[1]\t$cds_ps[$j]->[2]\t".($cds_ps[$j-1]->[4]+1)."\t".($cds_ps[$j]->[3]-1)."\t$cds_ps[$j]->[5]\t$cds_ps[$j]->[6]\t$cds_ps[$j]->[7]\t$cds_ps[$j]->[8]\n";
			}
		}
	}
}
