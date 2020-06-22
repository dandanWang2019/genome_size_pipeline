#! /usr/bin/perl

use strict;
use warnings;

my $file = shift; #fasta file;
my $name = /(.*)\.fa/;

open O, "> $0.sh";

`mkdir align_soloLTRs`;
print O "cd align_soloLTRs; muscle3.8.31/muscle3.8.31_i86linux64 -in $file -out $name.3.5.ltr.fa.align; ClustalW/clustalw-2.1-linux-x86_64-libcppstatic/clustalw2 -INFILE=$name.3.5.ltr.fa.align -CONVERT -TYPE=DNA -OUTFILE=$name.3.5.ltr.fa.align.phy -OUTPUT=PHYLIP; phylip/phylip-3.696/exe/dnadist < $name.3.5.ltr.fa.align.phylip; mv outfile $name.3.5.ltr.fa.align.dnadist\n";

close O;
