#! /usr/bin/perl

use strict;
use warnings;

my @filelist = glob("./08.all.dnadiat/*");

`mkdir 09.insertion.whole.time`;

for my $file (@filelist){
    chomp $file;
    $file =~ /.*\/.*dnadiat\/(.*)\.tsv/;
    my $name = $1;
    # my %h;
    open IN, "< $file" or die "perl $0 $file\n";
    open O, "> ./09.insertion.whole.time/$name.csv" or die "perl $0 $name\n";
    print O "ID\tinsertion\n";
    readline IN;
    while(<IN>){
	chomp;
	my ($id, $dnadist) = (split/\s+/)[0, 1];
	my $time = (($dnadist*100)/2.6);
	my %h;
	$h{$id} = $time;
	for my $key(sort keys %h){
	    print O "$key\t$h{$key}\n";
	}
    }
    close IN;
    close O;
}
