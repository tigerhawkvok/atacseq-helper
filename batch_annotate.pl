#!/usr/bin/perl

use strict;
use warnings;
use Statistics::R;
use File::Basename;
#### As of 9/1/17 not 100% bug free. - AY I will get to it though!!! ####
die "usage: batch_annotate.pl <Output prefix to put in front of bed and annotated folders>\n" unless @ARGV==1;

`mkdir $ARGV[0]_BED_FILES`;
`mkdir $ARGV[0]_ANNOTATION_FILES`;

my $c =`ls ./`;
my @array = split(/\n/, $c);

`mv *.merged.bed $ARGV[0]_BED_FILES`;

my $d =`ls $ARGV[0]_BED_FILES`;
my @arrays = split(/\n/, $d);
my $R = Statistics::R->new();

$R->run(q`source("https://bioconductor.org/biocLite.R")`);
$R->run(q`biocLite(c("rtracklayer", "ChIPpeakAnno", "GenomicFeatures"))`);
$R->run(q`library("rtracklayer")`);
$R->run(q`library("ChIPpeakAnno")`);
$R->run(q`library("GenomicFeatures")`);
$R->run(q`txdb<-loadDb("./Slycopersicum310.sqlite")`);
$R->run(q`ge<- genes(txdb, columns=c("tx_name", "gene_id", "tx_type"))`);

print "Working on annontating bed files.\n\n";
use Cwd qw(getcwd);
foreach my $files (@arrays){

    my $dirname = $files; #dirname(getcwd);

    print "annotating file = $dirname\n";

    $R->set(`infile`,$dirname);
    $R->run(q`print(infile)`);
    $R->run(q`peaksGR<-import(infile)`);
    $R->run(q`annotatedPeak<-annotatePeakInBatch(peaksGR, AnnotationData=genes(txdb))`);
    $R->run(q`dfa<-data.frame(as.data.frame(annotatedPeak))`);
    $R->set(`outfile`,"$dirname.xls");
    $R->run(q`write.table(dfa,outfile,quote=FALSE, sep="\t", col.names = NA)`);
    print "\n\n";
}

`mv $ARGV[0]_BED_FILES/*.xls $ARGV[0]_ANNOTATION_FILES`;
