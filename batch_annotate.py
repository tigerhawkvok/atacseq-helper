#!python3
"""
Emulates an actually functional version of
batch_annotate.pl

With more "let's not try to do things already done"!
"""
import rpy2
import rpy2.robjects as robjects
import os
import glob

parentDir = os.getcwd().split("/").pop()

bedFileDir = parentDir+"_BED_FILES"
annotationDir = parentDir+"_ANNOTATION_FILES"

if not os.path.exists(bedFileDir):
    os.mkdir(bedFileDir)
else:
    print("Skipping creation of bedfile directory...")

if not os.path.exists(annotationDir):
    os.mkdir(annotationDir)
else:
    print("Skipping creation of annotation directory...")

if len(glob.glob("*.merged.bed")) > 0:
    os.system("mv *.merged.bed "+bedFileDir+"/*.merged.bed")

with open("./ChIPpeakAnno_commands_for_R_source.r", "r") as rSource:
    rCode = rSource.read()
    realRCode = rCode.replace("$$REPLACE_OUT_DIR$$", annotationDir).replace("$$REPLACE_IN_DIR$$", bedFileDir)
    # Now we run the literal R code
    #
    # We don't actually give a crap about its output.
    #
    # See:
    # https://rpy2.readthedocs.io/en/version_2.8.x/introduction.html#evaluating-r-code
    print("\n\n\nAbout to run:\n\n"+realRCode+"\n\n")
    try:
        robjects.r(realRCode)
    except rpy2.rinterface.RRuntimeError:
        print("Couldn't execute code, try it manually:\n\n")
        print(realRCode)
print("R is done processing the directory")
os.system("mv "+bedFileDir+"/*.xls "+annotationDir)
print("Operation complete")
