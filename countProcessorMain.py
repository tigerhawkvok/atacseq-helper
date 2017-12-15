#!python3
import rpy2
import rpy2.robjects as robjects
import os
import glob
import re
import io
from contextlib import redirect_stdout

dirName = "./CountingResults"
if not os.path.exists(dirName):
    raise Exception("Invalid count directory path")

countFiles = glob.glob(dirName+"/*counts.txt")
gff3Files = glob.glob("./*.gff3")
for gff3 in gff3Files:
    # These provide the pattern basis
    gff3File = os.path.split(gff3)[1]
    gff3Root = os.path.splitext(gff3File)[0]
    groupList = list()
    for countFile in countFiles:
        if not gff3Root in countFile:
            continue
        # We're only examining count files that have names matching
        # the gff3, since that's how we're grouping them
        countFileName = os.path.split(countFile)[1]
        countFileName = countFileName.replace("-counts","") # We don't need or want counts in the name
        groupList.append("'"+os.path.splitext(countFileName)[0]+"'")
    distinctConditions = list()
    conditionLabel = list()
    for fileRoot in groupList:
        conditionBasis = "'"+fileRoot.split("-").pop().split("_").pop()+"'"
        conditionLabel.append(conditionBasis)
        if not conditionBasis in distinctConditions:
            distinctConditions.append(conditionBasis)
    with open("./countProcessor.r") as rScriptHandle:
        rScript = rScriptHandle.read()
        rScript = rScript.replace("$$COUNTS_DIRECTORY$$", dirName)
        rScript = rScript.replace("$$COUNTS_SUBSET$$", gff3Root)
        rScript = rScript.replace("$$COUNTS_PROCESSED_OUTPUT$$", gff3Root+"-Output.csv")
        rScript = rScript.replace("$$COUNTS_PROCESSED_OUTPUT2$$", gff3Root+"-NormAndScaled-Output.csv")
        rScript = rScript.replace("$$COUNTS_PROCESSED_OUTPUT3$$", gff3Root+"-NormAndScaled-NotNormalized-Output.txt")
        rScript = rScript.replace("$$COUNTS_FILES_NAMES_CSV$$", ", ".join(groupList)) #
        rScript = rScript.replace("$$COUNTS_FILES_NAMES_CONDITIONS_CSV$$", ", ".join(conditionLabel)) #
        rScript = rScript.replace("$$COUNTS_DISTINCTCONDITIONS_CSV$$", ", ".join(distinctConditions)) #
        rScript = rScript.replace("$$GROUP_EL1$$", groupList[0]) #
        realRCode = rScript.replace("$$GROUP_EL2$$", groupList[1]) #
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
        with open(dirName+"/"+gff3Root+"-process-exec.r", "w") as rOut:
            rOut.write(realRCode)
