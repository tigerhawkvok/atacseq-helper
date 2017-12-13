#!python3
"""
Loop over SAM files and output BAM files.

Prereqs:
    - Homebrew. All other instructions assume you have this installed.
    - pip. Download and run get-pip.py (just Google it, since the path/version may change)
    - Homer. Execute in your terminal: TODO COMPLETE
        brew update && brew install wget && mkdir ~/homerdl && cd ~/homerdl && wget http://homer.ucsd.edu/homer/configureHomer.pl && brew install perl && PATH=/usr/local/Cellar/perl/VERSION/bin:$PATH && /Users/USER/perl5/bin/cpanm Statisics::R && perl configureHomer.pl -install
    - Bedtools. Run in your terminal:
        brew tap homebrew/science && brew install bedtools
    - Samtools. TODO INSTALL INSTRUCTIONS
        brew install autoconf && brew install automake

If your files are zipped, this program will unzip them first. To conserve space, it will remove the zipped files when the SAM files are made,
and remove the SAM files when the BAM files are made.

## Running:

To run this, place this in the directory of your files and run 

    python samlooper.py

from that directory in your terminal. 
So, for example, you'd launch Terminal then run 
"cd /Volumes/MyExternalDrive/MyGeneticsFolder" followed by "python samlooper.py" 
(or whatever you named this file).


@author Philip Kahn
@date 2017.12.08
"""

############### Configuration:

# Set to 'True' or 'False' (no quotes) to run or not run footprinting
DO_FOOTPRINTING = False 



##################################### Real script follows ###################################
import glob
import os
import datetime as dt
#pylint: disable=C1801
fullScriptStart = dt.datetime.now()
print("\n\n")
# Set up the runner function
successful = list()
unsuccessful = list()
def processSAMFiles():
    """
    Processes the SAM files in the directory cleanly.

    It's a bit messily handled from a rewrite (with bad rescoping issues),
    but it works just fine.
    """
    #pylint: disable=W0621,W0703
    files = glob.glob("*.sam")
    for i, file in enumerate(files):
        loopStart = dt.datetime.now()
        try:
            if len(files) is not 1:
                print("\n\nRunning file #"+str(i + 1)+" of "+str(len(files)))
            # Set up the output file names
            output = file.replace(".sam", ".bam")
            outputSorted = output.replace(".bam", ".sorted.bam")
            # Pre-do the commands
            cmd = "samtools view -S -b "+file+" > "+output
            cmd2 = "samtools sort "+output+" -o "+outputSorted
            cmd3 = "samtools index "+outputSorted
            # Actual file execution
            print("\tExecuting `"+cmd+"`")
            os.system(cmd)
            print("Created binary")
            print("\tExecuting `"+cmd2+"`")
            os.system(cmd2)
            print("Created sorted")
            print("\tExecuting `"+cmd3+"`")
            os.system(cmd3)
            print("Created index")
            successful.append(file)
            # Remove the original .sam file to conserve space
            os.system("rm "+file)
            print("Completed processing of "+file+" in "+str(dt.datetime.now() - loopStart))
        except KeyboardInterrupt:
            break
        except Exception:
            print("There was a problem processing this file. Going to leave it alone.")
            print("Manually examine "+file)
            unsuccessful.append(file)
            continue
    print("Processed "+str(len(files))+" SAM files")

zipFiles = glob.glob("*.sam.gz")

unzipped = 0
if len(zipFiles) > 0:
    # We want to process the files in step with the unzipping, to avoid space problems.
    for i, file in enumerate(zipFiles):
        cmd = "gzip -d "+file
        print("Unzipping file "+str(i+1)+" of "+str(len(zipFiles)))
        os.system(cmd)
        # Process all SAM files in the directory.
        # Since the function will remove the files when done, this is fine to call.
        processSAMFiles()
        unzipped += 1

if unzipped is 0:
    print("Didn't need to unzip any files. Starting processing....")
    # Process all files in the directory
    processSAMFiles()

if len(unsuccessful) > 0:
    print("There were problems processing "+str(len(unsuccessful))+" files:")
    print(unsuccessful)


print("Completed converting files in directory in "+str(dt.datetime.now() - fullScriptStart))

# Now, we want to do the file processing to find the peaks
# Based on
# https://ucdavis.app.box.com/file/215570601375
"""
Original Perl script this is based on:

#!/usr/bin/perl


use strict;
use warnings;

die "usage: batch_homer.pl <Path to folder with indexed .q2.bam files (typically *_BOWTIE/)> <Output folder to put Homer peak files>\n" unless ARGV==2;

`mkdir $ARGV[1]`;

my $c =`ls $ARGV[0]`;
my @array = split(/\n/, $c);

foreach my $file (@array){
	print "working on file = $file\n";
    `mkdir $file.folder`;
    `makeTagDirectory $file.folder/ $file`;
    `findpeaks $file.folder/ -o $file.peaks -gsize 8.2e8 -minDist 150 -region -regionRes 1`;
    `pos2bed.pl $file.peaks | bedtools sort | bedtools merge > $file.peaks.merged.bed`;
    print "\n\n";
      }

"""

# Find files that are not q2, and make them
bamFiles = glob.glob("*.sorted.bam") # Use this to only run on sorted files
#bamFiles = glob.glob("*.bam") # Use this to only run on all bam files
qualityBamFiles = glob.glob("*.q2.bam")
# Since they both end in *.bam, we want to remove processed files from the list of things we need to process
unprocessedBamFiles = list(set(bamFiles) - set(qualityBamFiles))

for i, rawFile in enumerate(unprocessedBamFiles):
    # samtools view -q 2 -b file.sorted.bam > file.sorted.q2.bam
    print("Filtering quality on file "+str(i + 1)+" of "+str(len(unprocessedBamFiles)))
    fileNamePeices = rawFile.split(".")
    fileNamePeices.pop()
    fileNamePeices.append("q2.bam")
    newFile = ".".join(fileNamePeices)
    if os.path.exists(newFile):
        print("Quality file exists, skipping for "+newFile)
        continue
    cmd = "samtools view -q 2 -b "+rawFile+" > "+newFile
    os.system(cmd)

# Now that we've sorted them all by quality, we can re-generate the quality list and process those as the perl file
qualityBamFiles = glob.glob("*.q2.bam")
for i, bamFile in enumerate(qualityBamFiles):
    # Here we go line by line to emulate the perl file sequence
    # and the commands from Marko's documentation.
    #
    # When a discrepancy exists, we resolve in favor of Marko's documentation.
    if not os.path.exists(bamFile+".bai"):
        # We need this for footprinting
        # Yes, again.
        print("\tIndexing `"+bamFile+"`")
        os.system("samtools index "+bamFile)
    if not os.path.exists(bamFile+".peaks"):
        print("Starting peak search for file "+str(i + 1)+" of "+str(len(qualityBamFiles)))
        # Create a directory for the file based on the base filename
        dirName = bamFile.split(".").pop(0)
        print("\tCreating directory `"+dirName+"`")
        try:
            os.mkdir(dirName)
        except FileExistsError:
            print("\n\n\t@@@@ DUPLICATE FILENAME WARNING @@@@")
            print("\t\tCan't process "+bamFile+": base filenames must be unique (`"+bamFile.split(".").pop(0)+"` exists)")
            print("\t\tYou'll need to run this file manually\n")
            continue
        # Make the tag directory via Homer
        cmd1 = "makeTagDirectory "+dirName+"/ "+bamFile
        print("\tExecuting `"+cmd1+"`")
        os.system(cmd1)
        # Find the peaks
        #  Note: -gsize parameter is the effective genome size (Arabidopsis = 1.2e8, tomato = 8.2e8, rice = 3.7e8, Medicago = 4e8)
        cmd2 = "findPeaks "+dirName+"/ -o "+bamFile+".peaks -gsize 8.2e8 minDist 150 -region"
        print("\tExecuting `"+cmd2+"`")
        os.system(cmd2)
    else:
        print("Already have a peak file for file "+str(i + 1)+" of "+str(len(qualityBamFiles))+", only running bedTools")
    # bedtools
    cmd3 = "pos2bed.pl "+bamFile+".peaks | bedtools sort | bedtools merge > "+bamFile+".peaks.merged.bed"
    print("\tExecuting `"+cmd3+"`")
    os.system(cmd3)

if DO_FOOTPRINTING:
    # Find footprints
    pyDNaseRoot = "./pyDNase/pyDNase/scripts/"
    footprintsPath = pyDNaseRoot+"wellington_footprints.py"
    profilerPath = pyDNaseRoot+"dnase_average_profile.py"
    if not os.path.exists(footprintsPath):
        # Get an up-to-date copy of https://github.com/jpiper/pyDNase
        try:
            # Make sure we have write permissions
            os.system("chmod 0777 "+os.getcwd())
        except Exception:
            pass
        print("\n\nDoing a first-time only clonse of pyDNase...")
        os.system("git clone https://github.com/jpiper/pyDNase.git")
    # Check imports
    #pylint: disable=W0611
    print("\n\nAbout to check for library dependencies. If needed, you'll be prompted for your password\nIf you still get an ImportError, please manually run `sudo pip install PACKAGENAME`")
    try:
        import clint
    except ImportError:
        print("Installing python dependency clint")
        os.system("sudo pip3 install clint") # Python3
        os.system("sudo pip install clint") # Python2
    try:
        import pyDNase
    except ImportError:
        print("Installing python dependency pyDNase")
        os.system("sudo pip3 install pyDNase") # Python3
        os.system("sudo pip install pyDNase") # Python2
    if os.path.exists(footprintsPath):
        # Run the footprinter
        import shutil
        bedFiles = glob.glob("*.peaks.merged.bed")
        for i, bedFile in enumerate(bedFiles):
            # Prep the paths
            rootFile = bedFile.split(".").pop(0)
            sortedFile = rootFile+".sorted.q2.bam"
            footprintFile = sortedFile + "." + bedFile + ".WellingtonFootprints.FDR.0.01.bed"
            dirName = rootFile+"_footprints"
            # Create the footprint
            if not os.path.exists(footprintFile):
                print("\n\nAbout to footprint and profile file "+str(i + 1)+" of "+str(len(bedFiles)))
                if os.path.exists(dirName):
                    # Remove the old tree
                    shutil.rmtree(dirName)
                os.mkdir(dirName)
                cmd = footprintsPath+" -A "+bedFile+" "+sortedFile+" "+dirName
                print("\tExecuting `"+cmd+"`")
                os.system(cmd)
            else:
                print("\n\nSkipping creating the footprint file "+footprintFile+", profiling only")
            # Find the average profile
            if os.path.exists(profilerPath):
                # Run it
                if not os.path.exists(rootFile+"_cut_profile.pdf"):
                    cmd = profilerPath+" -A ./"+dirName+"/"+footprintFile+" "+rootFile+".sorted.q2.bam "+rootFile+"_cut_profile.pdf"
                    print("\tExecuting "+cmd)
                    os.system(cmd)
                else:
                    print("\tSkipping profile generation -- already exists")
            else:
                print("Couldn't find `dnase_average_profile.py`, not profiling")
    else:
        print("Couldn't find `"+footprintsPath+"`, not footprinting or profiling")

print("\n\nFull script completed in "+str(dt.datetime.now() - fullScriptStart))