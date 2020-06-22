#! /usr/bin/perl

use strict;
use warnings;

my @filelist = glob("./*gff"); # gff file;
my %h;

for my $file(@filelist){
    chomp $file;
    $file =~ /.*\/(.*)\.g/;
    my $name = $1;
    open IN, "< $file";
    while(<IN>){
	chomp;
	next if(/^#/);
	next if(/^$/);
	my ($type, $start, $end) = (split/\s+/)[2, 3, 4];
	if($type =~ /gene/i){
	    $h{$name}{gene} += (abs($end - $start) + 1);
	    $h{$name}{gnum}++;
	}elsif($type =~ /CDS/i){
	    $h{$name}{cds} += (abs($end - $start) + 1);
	    $h{$name}{cnum}++;
	}
    }
}
open O, "> $0.csv";
print O "species\tgene_length\tcds_length\tgene_num\tcds_num\n";
for my $sp (sort keys %h){
    print O "$sp\t$h{$sp}{gene}\t$h{$sp}{cds}\t$h{$sp}{gnum}\t$h{$sp}{cnum}\n";
}
close IN;
close O;
    
