#!python3
"""
For a set of file pairs, generate htseq-count outputs

Emulates htseq-counts script from
https://github.com/simon-anders/htseq/blob/41ac2e51f64a1fb38129ceabf0f06a3e0e37825e/python3/HTSeq/scripts/count.py#L26-L325


@author Philip Kahn
@date 2017.12.13
"""

# Label mapping: mandatory configuration needed!

overwriteExistingCounts = False

bamPrettyMap = {
    "LYR_CD_CON1": "AT-A-10_S4_L001.sorted.q2.bam",
    "LYR_CD_CON2": "AT-A-11_S9_BowtieOut.sorted.q2.bam",
    "LYR_CD_CON3": "AT-B-38_S22_BowtieOut.sorted.q2.bam",
    "LYR_CD_DR1": "AT-A-16_S1_BowtieOut.sorted.q2.bam",
    "LYR_CD_DR2":"AT-A-18_S6_BowtieOut.sorted.q2.bam",
    "LYR_CD_DR3": "AT-B-17_S24_BowtieOut.sorted.q2.bam",
    "LYR_CW_CON1":"AT-A-10_S4_L001.sorted.q2.bam",
    "LYR_CW_CON2":"AT-A-11_S9_BowtieOut.sorted.q2.bam",
    "LYR_CW_CON3":"AT-B-38_S22_BowtieOut.sorted.q2.bam",
    "LYR_CW_WL1" :"AT-A-14_S11_BowtieOut.sorted.q2.bam",
    "LYR_CW_WL2" :"AT-A-15_S5_BowtieOut.sorted.q2.bam",
    "LYR_CW_WL3": "AT-B-13_S23_BowtieOut.sorted.q2.bam",
    "ATH_CD_CON1":"AT-A-20_S2_BowtieOut.sorted.q2.bam",
    "ATH_CD_CON2":"AT-B-19_S30_BowtieOut.sorted.q2.bam",
    "ATH_CD_CON3":"AT-B-21_S26_BowtieOut.sorted.q2.bam "

}


# Main script

from HTSeq.scripts import count
import os
import glob
import re
import io
from contextlib import redirect_stdout

dirName = "./CountingResults"
if not os.path.exists(dirName):
    # The output directory doesn't exist yet
    os.mkdir(dirName)
else:
    # It already exists
    if overwriteExistingCounts:
        i = 0
        for oldRead in glob.glob(dirName+"/*counts.txt"):
            os.unlink(oldRead)
            i += 1
        print("Removed "+str(i)+" old counted reads")
    else:
        print("NOTICE: Your existing counts will be preserved and not ovewritten")



i = 0
# Find all the gff3 files
gff3Pool = glob.glob("*.gff3")
# Get the total file count
filePool = len(gff3Pool) * len(bamPrettyMap)
badFileList = list()
cleanupAlignmentMessages = re.compile(r"^[0-9]+ .*?processed\.$")
didBreak = False
for gff3File in gff3Pool:
    # Map every gff3 onto every bam file
    if didBreak:
        break
    print("Doing counts against `"+gff3File+"`")
    for label, bamFile in bamPrettyMap.items():
        gff3 = gff3File[:-5]
        outFile = gff3 + "-" + label + "-counts.txt"
        if os.path.exists(outFile):
            filePool -= 1
            print("\tFILE EXISTS: `"+outFile+"`. Skipping.")
            badFileList.append([bamFile, "Counts already exist"])
            continue
        print("Counting file "+str(i + 1)+" of "+str(filePool))
        speciesMatch = label.split("_").pop(0)
        if not speciesMatch in gff3File and len(speciesMatch) > 0:
            print("\tSpecies "+speciesMatch+" does not match GFF3 `"+gff3File+"`, skipping")
            filePool -= 1
            continue
        ############################################
        # Default arguments and argument order interpreted from here:
        # https://github.com/simon-anders/htseq/blob/41ac2e51f64a1fb38129ceabf0f06a3e0e37825e/python3/HTSeq/scripts/count.py#L345-L455
        #
        # Sample:
        #
        # htseq-count -m union -s no --nonunique all -i gene_id -t exon -f bam AT-A-10_S4_L001_BowtieOut.sorted.q2.bam M-LYR-IN-11-CONTROLandDROUGHT.gff3 > M-LYR-IN-11-CONandDROUGHT-CON1-counts.txt
        #
        # Args given:
        # -m union
        # -s no
        # --nonunique all
        # -i gene_id
        # -t exon
        # -f bam
        ############################################
        print("\tUsing BAM file `"+bamFile+"`")
        if not os.path.exists(bamFile):
            print("\t\tThe system couldn't locate the file, trying the next one ...")
            badFileList.append([bamFile,"Does Not Exist"])
            continue
        samPass = [bamFile]
        # We need to redirect stdout to a buffer to write a string
        # See:
        # https://stackoverflow.com/a/22434594/6860368
        outputString = ""
        with io.StringIO() as buf, redirect_stdout(buf):
            try:
                count.count_reads_in_features(
                    samPass, # BAM file
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
                outputString = buf.getvalue()
                i += 1
            except KeyboardInterrupt:
                # We want this to really interrupt
                didBreak = True
                break
            except Exception as e:
                print("\t\tHTSeq error processing file: "+str(e))
                badFileList.append([bamFile, str(e)])
                print("\t\tTrying next file...")
                continue
        if didBreak:
            break
        ## Issue mentioned by Marko
        #outputString.replace("\n\t", ", ")
        # Remove messages
        print("\tTidying up the file...")
        outputStringClean = cleanupAlignmentMessages.sub("", outputString).strip()
        # Prepare for writing
        fullPath = dirName+"/"+outFile
        with open(fullPath, "w") as fileWriter:
            fileWriter.write(outputStringClean)
            print("Wrote counts to `"+fullPath+"`")
    print("Finish processing "+gff3File)
# Convert all the raw outputs to CSV, if possible
try:
    import csv
    for countsFilePath in glob.glob(dirName+"/*counts.txt"):
        # Read the existing counts file
        with open(countsFilePath) as countsFile:
            csvPath = countsFilePath.replace("txt", "csv")
            counts = countsFile.read()
            # Open up a CSV for writing
            with open(csvPath, "w") as csvFile:
                countsWriter = csv.writer(csvFile, delimiter=",", quoting=csv.QUOTE_ALL)
                # Split each new line to a new row
                for row in counts.split("\n"):
                    if len(row) is 0:
                        continue
                    # Separate out tab delimited stuff as columns
                    countsWriter.writerow(row.split("\t"))
except Exception:
    print("Failed to save counts as CSV (the raw TXT files still exist)")
# Final output
print("Successfully processed "+str(i)+" files")
if len(badFileList) > 0:
    print(str(len(badFileList))+" files did not process correctly")
    print("Please check these files and try them again:")
    from tabulate import tabulate
    tableMessage = tabulate(badFileList, headers=["File", "Error"], tablefmt="grid")
    print(tableMessage)
print("Script complete")
