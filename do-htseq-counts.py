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

# Args given:
# -m union
# -s no
# --nonunique all
# -i gene_id
# -t exon
# -f bam

fileSets = [
    []
]


for i, filePair in enumerate(fileSets):
    print("Counting file "+str(i+1)+" of "+str(len(fileSets)))
    outputString = count.count_reads_in_features(
        filePair[0],
        filePair[1],
        "bam",
        "name",
        30000000,
        "no",
        "union",
        "all",
        "score",
        "score",
        "exon",
        "gene_id",
        (),
        None,
        10,
        "")
    gff3 = filePair[1][:-5]
    outFile = gff3 + "-counts.txt"
    fullPath = dirName+"/"+outFile
    with open(fullPath, "w") as fileWriter:
        fileWriter.write(outputString)
        print("Wrote counts to `"+fullPath+"`")
