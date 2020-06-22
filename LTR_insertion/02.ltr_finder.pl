#! /usr/bin/perl

use strict;
use warnings;

my @file = <.\/splitBYscaff/*\/*.fa>;

for my $file (@file){
    chomp $file;
    $file =~ /.*\/(.*).fa/;
    my $name = $1;
    system ("ltr_finder $file -s /home/share/users/wangdandan2019/software/LTR_Finder/source/tRNA/Athal-tRNAs.fa -w 2 -C -D 15000 -d 1000 -L 7000 -l 100 -p 20 -M 0.85 > ltr_finder_out_1/$name.out");
}
