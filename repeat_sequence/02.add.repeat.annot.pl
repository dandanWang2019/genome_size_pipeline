#! /usr/bin/perl

use strict;
use warnings;

my $file = shift; # ltr seq fasta extracted from ltr_finder;

open O, "> $0.sh";
print O "cd-hit-est -i $file -o Arabidopsis_thaliana.ltr.fa -c 0.8 -n 5 -M 16000 -d 0;\n";
print O "RepeatClassifier -consensi Arabidopsis_thaliana.ltr.fa";
print 0 "cat Arabidopsis_thaliana.ltr.fa.classified ./RM_*/consensi.fa.classified > Arabidopsis_thaliana.lib;\n";
print O "RepeatMasker -lib Arabidopsis_thaliana.lib -pa 30 Arabidopsis_thaliana.fa;\n";

close O;
