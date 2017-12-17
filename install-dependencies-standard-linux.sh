#!/bin/bash
#####################
# Have you read the README?
#
# Make sure you do so that your system is ready
# to run this file! Just one or two commands
# that are platform-specific.
#
# If you've already installed some dependencies,
# you can just execute the bits between the comments.
#####################
# Environment
export PATH="$HOME/miniconda3/bin:$PATH"
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bash_profile 
brew update
# Install wget. We use this to download a few things.
# Install perl5 (OSX's perl is out of date)
brew install perl
PATH=/usr/local/Cellar/perl/perl5/bin:$PATH
echo 'export PATH="/usr/local/Cellar/perl/perl5/bin:$PATH"' >> ~/.bash_profile
# Install pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
# Install R
brew install R
# Install statistics package
~/perl5/bin/cpanm Statisics::R
# Install Homer
mkdir ~/homerdl
cd ~/homerdl
wget http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install
# Install Samtools
brew install autoconf
brew install automake
cd ~
git clone https://github.com/samtools/samtools.git
cd samtools
autoreconf
./configure
make
make install
# Install Bedtools
brew tap homebrew/science
brew install bedtools
# Install Scipy packages
python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
# Install pyDNase and its dependencies
pip install clint
pip install pyDNase
# Install htseq
pip install htseq
pip install tabulate
# Install rpy
brew install llvm
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH="/usr/local/opt/llvm/lib:$LD_LIBRARY_PATH"' >> ~/.bash_profile
echo 'export LIBRARY_PATH="/usr/local/opt/llvm/lib:$LIBRARY_PATH"' >> ~/.bash_profile
export PATH=/usr/local/opt/llvm/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/opt/llvm/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/opt/llvm/lib:$LIBRARY_PATH
pip install rpy2 # Incompatible with 2.x
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda install pysam 
conda install -c r rpy2
conda install -c bioconda htseq
# https://www.ebi.ac.uk/sites/ebi.ac.uk/files/groups/bertone/software/PeakAnnotator_Java_README
wget https://www.ebi.ac.uk/sites/ebi.ac.uk/files/groups/bertone/software/PeakAnnotator_Java_1.4.tar.gz
tar -xvzf PeakAnnotator_Java_1.4.tar.gz
mv PeakAnnotator_Java_1.4/PeakAnnotator.jar ./
rm -r PeakAnnotator_Java_1.4
rm PeakAnnotator_Java_1.4.tar.gz

