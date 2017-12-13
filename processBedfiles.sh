#!/bin/bash
bedtools intersect -wa -a AT-A-10_S4_L001_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-11_S9_BowtieOut.sorted.q2.bam.peaks.merged.bed  -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-1and2.bed;
bedtools intersect -wa -a AT-A-11_S9_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-10_S4_L001_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-2and1.bed;
cat M-LYR-IN-11-CONTROL-1and2.bed M-LYR-IN-11-CONTROL-2and1.bed > M-LYR-IN-11-CONTROL-1and2.bed;
bedtools sort -i M-LYR-IN-11-CONTROL-1and2.bed | bedtools merge > M-LYR-IN-11-CONTROL-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-10_S4_L001_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-38_S22_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-1and3.bed;
bedtools intersect -wa -a AT-B-38_S22_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-10_S4_L001_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-3and1.bed;
cat M-LYR-IN-11-CONTROL-1and3.bed M-LYR-IN-11-CONTROL-3and1.bed > M-LYR-IN-11-CONTROL-1and3.bed;
bedtools sort -i M-LYR-IN-11-CONTROL-1and3.bed | bedtools merge > M-LYR-IN-11-CONTROL-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-11_S9_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-38_S22_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-2and3.bed;
bedtools intersect -wa -a AT-B-38_S22_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-11_S9_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-CONTROL-3and2.bed;
cat M-LYR-IN-11-CONTROL-2and3.bed M-LYR-IN-11-CONTROL-3and2.bed > M-LYR-IN-11-CONTROL-2and3.bed;
bedtools sort -i M-LYR-IN-11-CONTROL-2and3.bed | bedtools merge > M-LYR-IN-11-CONTROL-2and3-replicates.bed;

bedtools intersect -wa -a AT-A-16_S1_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-18_S6_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-1and2.bed;
bedtools intersect -wa -a AT-A-18_S6_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-16_S1_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-2and1.bed;
cat M-LYR-IN-11-DROUGHT-1and2.bed M-LYR-IN-11-DROUGHT-2and1.bed > M-LYR-IN-11-DROUGHT-1and2.bed;
bedtools sort -i M-LYR-IN-11-DROUGHT-1and2.bed | bedtools merge > M-LYR-IN-11-DROUGHT-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-16_S1_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-17_S24_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-1and3.bed;
bedtools intersect -wa -a AT-B-17_S24_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-16_S1_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-3and1.bed;
cat M-LYR-IN-11-DROUGHT-1and3.bed M-LYR-IN-11-DROUGHT-3and1.bed > M-LYR-IN-11-DROUGHT-1and3.bed;
bedtools sort -i M-LYR-IN-11-DROUGHT-1and3.bed | bedtools merge > M-LYR-IN-11-DROUGHT-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-18_S6_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-17_S24_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-2and3.bed;
bedtools intersect -wa -a AT-B-17_S24_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-18_S6_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-3and2.bed;
cat M-LYR-IN-11-DROUGHT-2and3.bed M-LYR-IN-11-DROUGHT-3and2.bed > M-LYR-IN-11-DROUGHT-2and3.bed;
bedtools sort -i M-LYR-IN-11-DROUGHT-2and3.bed | bedtools merge > M-LYR-IN-11-DROUGHT-2and3-replicates.bed;
bedtools intersect -wa -a AT-A-14_S11_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-15_S5_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-1and2.bed;
bedtools intersect -wa -a AT-A-15_S5_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-14_S11_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-FLOOD-2and1.bed;
cat M-LYR-IN-11-FLOOD-1and2.bed M-LYR-IN-11-FLOOD-2and1.bed > M-LYR-IN-11-FLOOD-1and2.bed;
bedtools sort -i M-LYR-IN-11-FLOOD-1and2.bed | bedtools merge > M-LYR-IN-11-FLOOD-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-14_S11_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-13_S23_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-1and3.bed;
bedtools intersect -wa -a AT-B-13_S23_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-14_S11_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-FLOOD-3and1.bed;
cat M-LYR-IN-11-FLOOD-1and3.bed M-LYR-IN-11-FLOOD-3and1.bed > M-LYR-IN-11-FLOOD-1and3.bed;
bedtools sort -i M-LYR-IN-11-FLOOD-1and3.bed | bedtools merge > M-LYR-IN-11-FLOOD-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-15_S5_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-13_S23_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-DROUGHT-2and3.bed;
bedtools intersect -wa -a AT-B-13_S23_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-15_S5_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-LYR-IN-11-FLOOD-3and2.bed;
cat M-LYR-IN-11-FLOOD-2and3.bed M-LYR-IN-11-FLOOD-3and2.bed > M-LYR-IN-11-FLOOD-2and3.bed;
bedtools sort -i M-LYR-IN-11-FLOOD-2and3.bed | bedtools merge > M-LYR-IN-11-FLOOD-2and3-replicates.bed;

mkdir MAINbedFILES;
cat M-LYR-IN-11-CONTROL-1and2-replicates.bed M-LYR-IN-11-CONTROL-1and3-replicates.bed M-LYR-IN-11-CONTROL-2and3-replicates.bed > M-LYR-IN-11-CONTROL-replicates.bed;
bedtools sort -i M-LYR-IN-11-CONTROL-replicates.bed | bedtools merge > M-LYR-IN-11-CONTROL-replicates-final.bed;
cat M-LYR-IN-11-DROUGHT-1and2-replicates.bed M-LYR-IN-11-DROUGHT-1and3-replicates.bed M-LYR-IN-11-DROUGHT-2and3-replicates.bed > M-LYR-IN-11-DROUGHT-replicates.bed;
bedtools sort -i M-LYR-IN-11-DROUGHT-replicates.bed | bedtools merge > M-LYR-IN-11-DROUGHT-replicates-final.bed;
cat M-LYR-IN-11-FLOOD-1and2-replicates.bed M-LYR-IN-11-FLOOD-1and3-replicates.bed M-LYR-IN-11-FLOOD-2and3-replicates.bed > M-LYR-IN-11-FLOOD-replicates.bed;
bedtools sort -i M-LYR-IN-11-FLOOD-replicates.bed | bedtools merge > M-LYR-IN-11-FLOOD-replicates-final.bed;
cat M-LYR-IN-11-CONTROL-replicates-final.bed M-LYR-IN-11-DROUGHT-replicates-final.bed > M-LYR-IN-11-CONTROLandDROUGHT.bed;
mv M-LYR-IN-11-CONTROLandDROUGHT.bed MAINbedFILES/;
cat M-LYR-IN-11-CONTROL-replicates-final.bed M-LYR-IN-11-FLOOD-replicates-final.bed > M-LYR-IN-11-CONTROLandFLOOD.bed;
mv M-LYR-IN-11-CONTROLandFLOOD.bed MAINbedFILES/;




bedtools intersect -wa -a AT-A-20_S2_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-19_S30_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-1and2.bed;
bedtools intersect -wa -a AT-B-19_S30_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-20_S2_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-2and1.bed;
cat M-ATH-IN-2-CONTROL-1and2.bed M-ATH-IN-2-CONTROL-2and1.bed > M-ATH-IN-2-CONTROL-1and2.bed;
bedtools sort -i M-ATH-IN-2-CONTROL-1and2.bed | bedtools merge > M-ATH-IN-2-CONTROL-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-20_S2_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-21_S26_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-1and3.bed;
bedtools intersect -wa -a AT-B-21_S26_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-20_S2_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-3and1.bed;
cat M-ATH-IN-2-CONTROL-1and3.bed M-ATH-IN-2-CONTROL-3and1.bed > M-ATH-IN-2-CONTROL-1and3.bed;
bedtools sort -i M-ATH-IN-2-CONTROL-1and3.bed | bedtools merge > M-ATH-IN-2-CONTROL-1and3-replicates.bed;
bedtools intersect -wa -a AT-B-19_S30_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-21_S26_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-2and3.bed;
bedtools intersect -wa -a AT-B-21_S26_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-19_S30_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-CONTROL-3and2.bed;
cat M-ATH-IN-2-CONTROL-2and3.bed M-ATH-IN-2-CONTROL-3and2.bed > M-ATH-IN-2-CONTROL-2and3.bed;
bedtools sort -i M-ATH-IN-2-CONTROL-2and3.bed | bedtools merge > M-ATH-IN-2-CONTROL-2and3-replicates.bed;

bedtools intersect -wa -a AT-A-25_S7_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-26_S12_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-1and2.bed;
bedtools intersect -wa -a AT-A-26_S12_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-25_S7_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-2and1.bed;
cat M-ATH-IN-2-DROUGHT-1and2.bed M-ATH-IN-2-DROUGHT-2and1.bed > M-ATH-IN-2-DROUGHT-1and2.bed;
bedtools sort -i M-ATH-IN-2-DROUGHT-1and2.bed | bedtools merge > M-ATH-IN-2-DROUGHT-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-25_S7_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-27_S16_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-1and3.bed;
bedtools intersect -wa -a AT-A-27_S16_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-25_S7_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-3and1.bed;
cat M-ATH-IN-2-DROUGHT-1and3.bed M-ATH-IN-2-DROUGHT-3and1.bed > M-ATH-IN-2-DROUGHT-1and3.bed;
bedtools sort -i M-ATH-IN-2-DROUGHT-1and3.bed | bedtools merge > M-ATH-IN-2-DROUGHT-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-26_S12_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-27_S16_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-2and3.bed;
bedtools intersect -wa -a AT-A-27_S16_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-26_S12_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-DROUGHT-3and2.bed;
cat M-ATH-IN-2-DROUGHT-2and3.bed M-ATH-IN-2-DROUGHT-3and2.bed > M-ATH-IN-2-DROUGHT-2and3.bed;
bedtools sort -i M-ATH-IN-2-DROUGHT-2and3.bed | bedtools merge > M-ATH-IN-2-DROUGHT-2and3-replicates.bed;

bedtools intersect -wa -a AT-B-22_S35_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-23_S28_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-1and2.bed;
bedtools intersect -wa -a AT-B-23_S28_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-22_S35_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-2and1.bed;
cat M-ATH-IN-2-FLOOD-1and2.bed M-ATH-IN-2-FLOOD-2and1.bed > M-ATH-IN-2-FLOOD-1and2.bed;
bedtools sort -i M-ATH-IN-2-FLOOD-1and2.bed | bedtools merge > M-ATH-IN-2-FLOOD-1and2-replicates.bed;
bedtools intersect -wa -a AT-B-22_S35_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-39_S31_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-1and3.bed;
bedtools intersect -wa -a AT-B-39_S31_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-22_S35_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-3and1.bed;
cat M-ATH-IN-2-FLOOD-1and3.bed M-ATH-IN-2-FLOOD-3and1.bed > M-ATH-IN-2-FLOOD-1and3.bed;
bedtools sort -i M-ATH-IN-2-FLOOD-1and3.bed | bedtools merge > M-ATH-IN-2-FLOOD-1and3-replicates.bed;
bedtools intersect -wa -a AT-B-23_S28_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-39_S31_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-2and3.bed;
bedtools intersect -wa -a AT-B-39_S31_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-23_S28_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-ATH-IN-2-FLOOD-3and2.bed;
cat M-ATH-IN-2-FLOOD-2and3.bed M-ATH-IN-2-FLOOD-3and2.bed > M-ATH-IN-2-FLOOD-2and3.bed;
bedtools sort -i M-ATH-IN-2-FLOOD-2and3.bed | bedtools merge > M-ATH-IN-2-FLOOD-2and3-replicates.bed;


cat M-ATH-IN-2-CONTROL-1and2-replicates.bed M-ATH-IN-2-CONTROL-1and3-replicates.bed M-ATH-IN-2-CONTROL-2and3-replicates.bed > M-ATH-IN-2-CONTROL-replicates.bed;
bedtools sort -i M-ATH-IN-2-CONTROL-replicates.bed | bedtools merge > M-ATH-IN-2-CONTROL-replicates-final.bed;
cat M-ATH-IN-2-DROUGHT-1and2-replicates.bed M-ATH-IN-2-DROUGHT-1and3-replicates.bed M-ATH-IN-2-DROUGHT-2and3-replicates.bed > M-ATH-IN-2-DROUGHT-replicates.bed;
bedtools sort -i M-ATH-IN-2-DROUGHT-replicates.bed | bedtools merge > M-ATH-IN-2-DROUGHT-replicates-final.bed;
cat M-ATH-IN-2-FLOOD-1and2-replicates.bed M-ATH-IN-2-FLOOD-1and3-replicates.bed M-ATH-IN-2-FLOOD-2and3-replicates.bed > M-ATH-IN-2-FLOOD-replicates.bed;
bedtools sort -i M-ATH-IN-2-FLOOD-replicates.bed | bedtools merge > M-ATH-IN-2-FLOOD-replicates-final.bed;
cat M-ATH-IN-2-CONTROL-replicates-final.bed M-ATH-IN-2-DROUGHT-replicates-final.bed > M-ATH-IN-2-CONTROLandDROUGHT.bed;
mv M-ATH-IN-2-CONTROLandDROUGHT.bed MAINbedFILES/;
cat M-ATH-IN-2-CONTROL-replicates-final.bed M-ATH-IN-2-FLOOD-replicates-final.bed > M-ATH-IN-2-CONTROLandFLOOD.bed;
mv M-ATH-IN-2-CONTROLandFLOOD.bed MAINbedFILES/;






bedtools intersect -wa -a AT-A-02_S10_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-01_S20_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-1and2.bed;
bedtools intersect -wa -a AT-B-01_S20_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-02_S10_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-2and1.bed;
cat M-BOP-IN-4-CONTROL-1and2.bed M-BOP-IN-4-CONTROL-2and1.bed > M-BOP-IN-4-CONTROL-1and2.bed;
bedtools sort -i M-BOP-IN-4-CONTROL-1and2.bed | bedtools merge > M-BOP-IN-4-CONTROL-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-02_S10_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-03_S21_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-1and3.bed;
bedtools intersect -wa -a AT-B-03_S21_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-02_S10_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-3and1.bed;
cat M-BOP-IN-4-CONTROL-1and3.bed M-BOP-IN-4-CONTROL-3and1.bed > M-BOP-IN-4-CONTROL-1and3.bed;
bedtools sort -i M-BOP-IN-4-CONTROL-1and3.bed | bedtools merge > M-BOP-IN-4-CONTROL-1and3-replicates.bed;
bedtools intersect -wa -a AT-B-01_S20_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-03_S21_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-2and3.bed;
bedtools intersect -wa -a AT-B-03_S21_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-01_S20_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-CONTROL-3and2.bed;
cat M-BOP-IN-4-CONTROL-2and3.bed M-BOP-IN-4-CONTROL-3and2.bed > M-BOP-IN-4-CONTROL-2and3.bed;
bedtools sort -i M-BOP-IN-4-CONTROL-2and3.bed | bedtools merge > M-BOP-IN-4-CONTROL-2and3-replicates.bed;

bedtools intersect -wa -a AT-A-08_S18_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-09_S3_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-1and2.bed;
bedtools intersect -wa -a AT-A-09_S3_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-08_S18_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-2and1.bed;
cat M-BOP-IN-4-DROUGHT-1and2.bed M-BOP-IN-4-DROUGHT-2and1.bed > M-BOP-IN-4-DROUGHT-1and2.bed;
bedtools sort -i M-BOP-IN-4-DROUGHT-1and2.bed | bedtools merge > M-BOP-IN-4-DROUGHT-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-08_S18_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-37_S34_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-1and3.bed;
bedtools intersect -wa -a AT-B-37_S34_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-08_S18_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-3and1.bed;
cat M-BOP-IN-4-DROUGHT-1and3.bed M-BOP-IN-4-DROUGHT-3and1.bed > M-BOP-IN-4-DROUGHT-1and3.bed;
bedtools sort -i M-BOP-IN-4-DROUGHT-1and3.bed | bedtools merge > M-BOP-IN-4-DROUGHT-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-09_S3_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-37_S34_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-2and3.bed;
bedtools intersect -wa -a AT-B-37_S34_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-09_S3_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-DROUGHT-3and2.bed;
cat M-BOP-IN-4-DROUGHT-2and3.bed M-BOP-IN-4-DROUGHT-3and2.bed > M-BOP-IN-4-DROUGHT-2and3.bed;
bedtools sort -i M-BOP-IN-4-DROUGHT-2and3.bed | bedtools merge > M-BOP-IN-4-DROUGHT-2and3-replicates.bed;

bedtools intersect -wa -a AT-A-06_S14_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-04_S29_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-1and2.bed;
bedtools intersect -wa -a AT-B-04_S29_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-06_S14_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-2and1.bed;
cat M-BOP-IN-4-FLOOD-1and2.bed M-BOP-IN-4-FLOOD-2and1.bed > M-BOP-IN-4-FLOOD-1and2.bed;
bedtools sort -i M-BOP-IN-4-FLOOD-1and2.bed | bedtools merge > M-BOP-IN-4-FLOOD-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-06_S14_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-05_S25_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-1and3.bed;
bedtools intersect -wa -a AT-B-05_S25_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-06_S14_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-3and1.bed;
cat M-BOP-IN-4-FLOOD-1and3.bed M-BOP-IN-4-FLOOD-3and1.bed > M-BOP-IN-4-FLOOD-1and3.bed;
bedtools sort -i M-BOP-IN-4-FLOOD-1and3.bed | bedtools merge > M-BOP-IN-4-FLOOD-1and3-replicates.bed;
bedtools intersect -wa -a AT-B-04_S29_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-05_S25_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-2and3.bed;
bedtools intersect -wa -a AT-B-05_S25_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-04_S29_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-BOP-IN-4-FLOOD-3and2.bed;
cat M-BOP-IN-4-FLOOD-2and3.bed M-BOP-IN-4-FLOOD-3and2.bed > M-BOP-IN-4-FLOOD-2and3.bed;
bedtools sort -i M-BOP-IN-4-FLOOD-2and3.bed | bedtools merge > M-BOP-IN-4-FLOOD-2and3-replicates.bed;


cat M-BOP-IN-4-CONTROL-1and2-replicates.bed M-BOP-IN-4-CONTROL-1and3-replicates.bed M-BOP-IN-4-CONTROL-2and3-replicates.bed > M-BOP-IN-4-CONTROL-replicates.bed;
bedtools sort -i M-BOP-IN-4-CONTROL-replicates.bed | bedtools merge > M-BOP-IN-4-CONTROL-replicates-final.bed;
cat M-BOP-IN-4-DROUGHT-1and2-replicates.bed M-BOP-IN-4-DROUGHT-1and3-replicates.bed M-BOP-IN-4-DROUGHT-2and3-replicates.bed > M-BOP-IN-4-DROUGHT-replicates.bed;
bedtools sort -i M-BOP-IN-4-DROUGHT-replicates.bed | bedtools merge > M-BOP-IN-4-DROUGHT-replicates-final.bed;
cat M-BOP-IN-4-FLOOD-1and2-replicates.bed M-BOP-IN-4-FLOOD-1and3-replicates.bed M-BOP-IN-4-FLOOD-2and3-replicates.bed > M-BOP-IN-4-FLOOD-replicates.bed;
bedtools sort -i M-BOP-IN-4-FLOOD-replicates.bed | bedtools merge > M-BOP-IN-4-FLOOD-replicates-final.bed;
cat M-BOP-IN-4-CONTROL-replicates-final.bed M-BOP-IN-4-DROUGHT-replicates-final.bed > M-BOP-IN-4-CONTROLandDROUGHT.bed;
mv M-BOP-IN-4-CONTROLandDROUGHT.bed MAINbedFILES/;
cat M-BOP-IN-4-CONTROL-replicates-final.bed M-BOP-IN-4-FLOOD-replicates-final.bed > M-BOP-IN-4-CONTROLandFLOOD.bed;
mv M-BOP-IN-4-CONTROLandFLOOD.bed MAINbedFILES/;






bedtools intersect -wa -a AT-A-30_S8_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-28_S36_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-1and2.bed;
bedtools intersect -wa -a AT-B-28_S36_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-30_S8_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-2and1.bed;
cat M-35S-IN-1-CONTROL-1and2.bed M-35S-IN-1-CONTROL-2and1.bed > M-35S-IN-1-CONTROL-1and2.bed;
bedtools sort -i M-35S-IN-1-CONTROL-1and2.bed | bedtools merge > M-35S-IN-1-CONTROL-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-30_S8_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-29_S32_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-1and3.bed;
bedtools intersect -wa -a AT-B-29_S32_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-30_S8_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-3and1.bed;
cat M-35S-IN-1-CONTROL-1and3.bed M-35S-IN-1-CONTROL-3and1.bed > M-35S-IN-1-CONTROL-1and3.bed;
bedtools sort -i M-35S-IN-1-CONTROL-1and3.bed | bedtools merge > M-35S-IN-1-CONTROL-1and3-replicates.bed;
bedtools intersect -wa -a AT-B-28_S36_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-29_S32_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-2and3.bed;
bedtools intersect -wa -a AT-B-29_S32_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-28_S36_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-CONTROL-3and2.bed;
cat M-35S-IN-1-CONTROL-2and3.bed M-35S-IN-1-CONTROL-3and2.bed > M-35S-IN-1-CONTROL-2and3.bed;
bedtools sort -i M-35S-IN-1-CONTROL-2and3.bed | bedtools merge > M-35S-IN-1-CONTROL-2and3-replicates.bed;

bedtools intersect -wa -a AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-1and2.bed;
bedtools intersect -wa -a AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-2and1.bed;
cat M-35S-IN-1-DROUGHT-1and2.bed M-35S-IN-1-DROUGHT-2and1.bed > M-35S-IN-1-DROUGHT-1and2.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-1and2.bed | bedtools merge > M-35S-IN-1-DROUGHT-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-1and3.bed;
bedtools intersect -wa -a AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-3and1.bed;
cat M-35S-IN-1-DROUGHT-1and3.bed M-35S-IN-1-DROUGHT-3and1.bed > M-35S-IN-1-DROUGHT-1and3.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-1and3.bed | bedtools merge > M-35S-IN-1-DROUGHT-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-1and4.bed;
bedtools intersect -wa -a AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-34_S17_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-4and1.bed;
cat M-35S-IN-1-DROUGHT-1and4.bed M-35S-IN-1-DROUGHT-4and1.bed > M-35S-IN-1-DROUGHT-1and4.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-1and4.bed | bedtools merge > M-35S-IN-1-DROUGHT-1and4-replicates.bed;
bedtools intersect -wa -a AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-2and3.bed;
bedtools intersect -wa -a AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-3and2.bed;
cat M-35S-IN-1-DROUGHT-2and3.bed M-35S-IN-1-DROUGHT-3and2.bed > M-35S-IN-1-DROUGHT-2and3.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-2and3.bed | bedtools merge > M-35S-IN-1-DROUGHT-2and3-replicates.bed;
bedtools intersect -wa -a AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-2and4.bed;
bedtools intersect -wa -a AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-35_S37_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-4and2.bed;
cat M-35S-IN-1-DROUGHT-2and4.bed M-35S-IN-1-DROUGHT-4and2.bed > M-35S-IN-1-DROUGHT-2and4.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-2and4.bed | bedtools merge > M-35S-IN-1-DROUGHT-2and4-replicates.bed;
bedtools intersect -wa -a AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-3and4.bed;
bedtools intersect -wa -a AT-B-40_S27_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-B-36_S33_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-DROUGHT-4and3.bed;
cat M-35S-IN-1-DROUGHT-3and4.bed M-35S-IN-1-DROUGHT-4and3.bed > M-35S-IN-1-DROUGHT-3and4.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-3and4.bed | bedtools merge > M-35S-IN-1-DROUGHT-3and4-replicates.bed;


bedtools intersect -wa -a AT-A-31_S19_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-32_S15_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-1and2.bed;
bedtools intersect -wa -a AT-A-32_S15_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-31_S19_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-2and1.bed;
cat M-35S-IN-1-FLOOD-1and2.bed M-35S-IN-1-FLOOD-2and1.bed > M-35S-IN-1-FLOOD-1and2.bed;
bedtools sort -i M-35S-IN-1-FLOOD-1and2.bed | bedtools merge > M-35S-IN-1-FLOOD-1and2-replicates.bed;
bedtools intersect -wa -a AT-A-31_S19_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-33_S13_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-1and3.bed;
bedtools intersect -wa -a AT-A-33_S13_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-31_S19_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-3and1.bed;
cat M-35S-IN-1-FLOOD-1and3.bed M-35S-IN-1-FLOOD-3and1.bed > M-35S-IN-1-FLOOD-1and3.bed;
bedtools sort -i M-35S-IN-1-FLOOD-1and3.bed | bedtools merge > M-35S-IN-1-FLOOD-1and3-replicates.bed;
bedtools intersect -wa -a AT-A-32_S15_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-33_S13_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-2and3.bed;
bedtools intersect -wa -a AT-A-33_S13_BowtieOut.sorted.q2.bam.peaks.merged.bed -b AT-A-32_S15_BowtieOut.sorted.q2.bam.peaks.merged.bed -f 0.5 -F 0.5 > M-35S-IN-1-FLOOD-3and2.bed;
cat M-35S-IN-1-FLOOD-2and3.bed M-35S-IN-1-FLOOD-3and2.bed > M-35S-IN-1-FLOOD-2and3.bed;
bedtools sort -i M-35S-IN-1-FLOOD-2and3.bed | bedtools merge > M-35S-IN-1-FLOOD-2and3-replicates.bed;


cat M-35S-IN-1-CONTROL-1and2-replicates.bed M-35S-IN-1-CONTROL-1and3-replicates.bed M-35S-IN-1-CONTROL-2and3-replicates.bed > M-35S-IN-1-CONTROL-replicates.bed;
bedtools sort -i M-35S-IN-1-CONTROL-replicates.bed | bedtools merge > M-35S-IN-1-CONTROL-replicates-final.bed;
cat M-35S-IN-1-DROUGHT-1and2-replicates.bed M-35S-IN-1-DROUGHT-1and3-replicates.bed M-35S-IN-1-DROUGHT-2and3-replicates.bed M-35S-IN-1-DROUGHT-1and4-replicates.bed M-35S-IN-1-DROUGHT-2and4-replicates.bed M-35S-IN-1-DROUGHT-3and4-replicates.bed > M-35S-IN-1-DROUGHT-replicates.bed;
bedtools sort -i M-35S-IN-1-DROUGHT-replicates.bed | bedtools merge > M-35S-IN-1-DROUGHT-replicates-final.bed;
cat M-35S-IN-1-CONTROL-replicates-final.bed M-35S-IN-1-DROUGHT-replicates-final.bed > M-35S-IN-1-CONTROLandDROUGHT.bed;
mv M-35S-IN-1-CONTROLandDROUGHT.bed MAINbedFILES/;
cat M-35S-IN-1-FLOOD-1and2-replicates.bed M-35S-IN-1-FLOOD-1and3-replicates.bed M-35S-IN-1-FLOOD-2and3-replicates.bed > M-35S-IN-1-FLOOD-replicates.bed;
bedtools sort -i M-35S-IN-1-FLOOD-replicates.bed | bedtools merge > M-35S-IN-1-FLOOD-replicates-final.bed;
cat M-35S-IN-1-CONTROL-replicates-final.bed M-35S-IN-1-FLOOD-replicates-final.bed > M-35S-IN-1-CONTROLandFLOOD.bed;
mv M-35S-IN-1-CONTROLandFLOOD.bed MAINbedFILES/;

