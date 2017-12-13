#!/bin/bash
htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-10_S4_L001_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-11_S9_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-38_S22_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-16_S1_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-DROUGHT1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-18_S6_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-DROUGHT2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-17_S24_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-DROUGHT3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-10_S4_L001_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-11_S9_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-38_S22_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-14_S11_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-FLOOD1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-15_S5_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-FLOOD2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-13_S23_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandFLOOD.gff3 > M-LYR-IN-11-CONandFLOOD-FLOOD3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-20_S2_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-19_S30_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-21_S26_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-25_S7_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-DROUGHT1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-26_S12_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-DROUGHT2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-27_S16_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandDROUGHT.gff3 > M-ATH-IN-2-CONandDROUGHT-DROUGHT3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-20_S2_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-19_S30_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-21_S26_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-22_S35_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-FLOOD1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-23_S28_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-FLOOD2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-39_S31_BowtieOut.sorted.q2.bam M-ATH-IN-2-CONTROLandFLOOD.gff3 > M-ATH-IN-2-CONandFLOOD-FLOOD3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-02_S10_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-01_S20_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-03_S21_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-08_S18_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-DROUGHT1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-09_S3_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-DROUGHT2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-37_S34_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandDROUGHT.gff3 > M-BOP-IN-4-CONandDROUGHT-DROUGHT3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-02_S10_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-01_S20_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-03_S21_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-06_S14_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-FLOOD1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-04_S29_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-FLOOD2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-05_S25_BowtieOut.sorted.q2.bam M-BOP-IN-4-CONTROLandFLOOD.gff3 > M-BOP-IN-4-CONandFLOOD-FLOOD3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-30_S8_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-28_S36_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-29_S32_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-34_S17_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-DROUGHT1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-35_S37_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-DROUGHT2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-36_S33_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-DROUGHT3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-40_S27_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandDROUGHT.gff3 > M-35S-IN-1-CONandDROUGHT-DROUGHT4-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-30_S8_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-CON1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-28_S36_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-CON2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-B-29_S32_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-CON3-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-31_S19_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-FLOOD1-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-32_S15_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-FLOOD2-counts.txt

 htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-33_S13_BowtieOut.sorted.q2.bam M-35S-IN-1-CONTROLandFLOOD.gff3 > M-35S-IN-1-CONandFLOOD-FLOOD3-counts.txt

 mkdir CountingResults

 cp *counts.txt CountingResults/

