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
import glob


dirName = "./CountingResults"
if not os.path.exists(dirName):
    os.mkdir(dirName)
else:
    i = 0
    for oldRead in glob.glob(dirName+"/*counts.txt"):
        os.unlink(oldRead)
        i += 1
    print("Removed "+str(i)+" old counted reads")


# Args given:
# -m union
# -s no
# --nonunique all
# -i gene_id
# -t exon
# -f bam

bamPrettyMap = {
    "CON1": "AT-A-10_S4_L001_BowtieOut.sorted.q2.bam",
    "CON2": "AT-B-38_S22_BowtieOut.sorted.q2.bam"
}


i = 0
# Find all the gff3 files
gff3Pool = glob.glob("*.gff3")
# Get the total file count
filePool = len(gff3Pool) * len(bamPrettyMap)
for gff3File in gff3Pool:
    # Map every gff3 onto every bam file
    for label, bamFile in bamPrettyMap.items():
        i += 1
        print("Counting file "+str(i+1)+" of "+str(filePool))
        ############################################
        # Default arguments and argument order interpreted from here:
        # https://github.com/simon-anders/htseq/blob/41ac2e51f64a1fb38129ceabf0f06a3e0e37825e/python3/HTSeq/scripts/count.py#L345-L455
        #
        # Sample:
        #
        # htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-10_S4_L001_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON1-counts.txt
        ############################################
        outputString = count.count_reads_in_features(
            bamFile, # BAM file
            gff3File, # GFF3 file
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
        gff3 = gff3File[:-5]
        outFile = gff3 + "-" + label + "-counts.txt"
        fullPath = dirName+"/"+outFile
        with open(fullPath, "w") as fileWriter:
            fileWriter.write(outputString)
            print("Wrote counts to `"+fullPath+"`")
    print("Finish processing "+gff3File)
print("Script complete")
