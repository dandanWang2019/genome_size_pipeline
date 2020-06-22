#! /usr/bin/perl

use strict;
use warnings;

my $file = shift; # file.fa for every species; Arabidopsis_thaliana as example;

$file =~ /(.*)\.fa/;
my $name = $1;
print "trf $file 2 7 7 80 10 50 500 -d -h;\n";
print "RepeatMasker -pa 30 -species ALL -nolow -norna -no_is -gff $file;\n";
print "RepeatModeler/RepeatModeler-open-1.0.11/BuildDatabase -name Atha $name 2>&1 | tee 01.BuildDatabase.log;\n";
print "RepeatModeler/RepeatModeler-open-1.0.11/RepeatModeler -pa 30 -database Atha 2>&1 | tee 02.RepeatModeler.log\n";

