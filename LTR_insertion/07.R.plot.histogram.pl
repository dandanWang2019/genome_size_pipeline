#! /usr/bin/perl

use strict;
use warnings;

my @filelist = glob("./09.insertion.whole.time/*");

open O ,"> $0\.R";
print O "library(ggpubr)\nlibrary(ggplot2)\n\n";
for my $file(@filelist){
    chomp $file;
    $file =~ /.*\/(.*)\.csv/;
    my $name = $1;
    print O "$name <- read_csv('$name.csv')\n";
    print O "ggplot($name, aes(x = insertion, y = ..density..)) +\ngeom_histogram(color = 'black', fill = '#e6ab02', size = .2, bins = 30, alpha = .5) +\ngeom_line(stat = 'density', color = 'firebrick2', size = .8) + my_theme\n\n";
}
close O;
