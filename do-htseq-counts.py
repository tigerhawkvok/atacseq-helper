#!python3
"""
For a set of file pairs, generate htseq-count outputs

Emulates htseq-counts script from
https://github.com/simon-anders/htseq/blob/41ac2e51f64a1fb38129ceabf0f06a3e0e37825e/python3/HTSeq/scripts/count.py#L26-L325


@author Philip Kahn
@date 2017.12.13
"""
from HTSeq.scripts import count
import os

dirName = "CountingResults"
if not os.path.exists(dirName):
    os.mkdir(dirName)
else:
    import glob
    i = 0
    for oldRead in glob.glob(dirName+"/*counts.txt"):
        os.unlink(oldRead)
        i += 1
    print("Removed "+str(i)+" old reads")


# Args given:
# -m union
# -s no
# --nonunique all
# -i gene_id
# -t exon
# -f bam

fileSets = [
    # Format:
    # ["bamfile", "gff3", "label"]
    ["AT-A-10_S4_L001_BowtieOut.sorted.q2.bam", "M-LYR-IN-11-CONTROLandDROUGHT.gff3", "CON1"],
    ["AT-B-38_S22_BowtieOut.sorted.q2.bam", "M-LYR-IN-11-CONTROLandDROUGHT.gff3", "CON2"]
]


for i, filePair in enumerate(fileSets):
    print("Counting file "+str(i+1)+" of "+str(len(fileSets)))
    ############################################
    # Default arguments and argument order interpreted from here:
    # https://github.com/simon-anders/htseq/blob/41ac2e51f64a1fb38129ceabf0f06a3e0e37825e/python3/HTSeq/scripts/count.py#L345-L455
    #
    # Sample:
    #
    # htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-10_S4_L001_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON1-counts.txt
    ############################################
    outputString = count.count_reads_in_features(
        filePair[0], # BAM file
        filePair[1], # GFF3 file
        "bam", # -f flag
        "name", # default
        30000000, # default
        "no", # -s flag
        "union", # -m flag
        "all", # --nonunique flag
        "score", # default
        "score", # default
        "exon", # -t flag
        "gene_id", # -i flag, default
        (), # Default
        None, # default
        10, # default
        "" # default
        )
    ## Issue mentioned by Marko
    #outputString.replace("\n\t", ", ")
    gff3 = filePair[1][:-5]
    outFile = gff3 + "-" + filePair[2] + "-counts.txt"
    fullPath = dirName+"/"+outFile
    with open(fullPath, "w") as fileWriter:
        fileWriter.write(outputString)
        print("Wrote counts to `"+fullPath+"`")
