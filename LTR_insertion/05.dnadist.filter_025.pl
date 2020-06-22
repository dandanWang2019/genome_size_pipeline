#!/usr/bin/perl

use strict;
use warnings;

my @filelist = glob("./*/06.ltr_insert_time/*dnadist");
#my %h;

for my $file (@filelist){
    chomp $file;
    $file =~ /.*\/(.*)\/06.ltr_insert_time\/.*/;
    my $name = $1;
    my %h;
    open IN, "< $file";
    while (<IN>){
	chomp;
	next if(/^ID/);
	my ($id, $dnadist) = (split/\s+/)[0,1];
	#print "$id";exit;
	$h{$id} = $dnadist if($dnadist le 0.25);
    }
    my $num;
    my $sum;
    for my $key(sort keys %h){
	$sum += $h{$key};
	$num = scalar(keys %h);
    }
    my $average = $sum/$num;
    print "$name\t$average\n";
}
close IN;
