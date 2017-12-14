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
brew update
# Install wget. We use this to download a few things.
brew install wget
# Install Python3
brew install python3
# Install perl5 (OSX's perl is out of date)
brew install perl
PATH=/usr/local/Cellar/perl/perl5/bin:$PATH
echo 'export PATH="/usr/local/Cellar/perl/perl5/bin:$PATH"' >> ~/.bash_profile
# Install pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
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
python3 -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
# Install pyDNase and its dependencies
pip3 install clint
pip install clint
pip3 install pyDNase
pip install pyDNase
# Install htseq
pip3 install htseq
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
pip3 install rpy2 # Incompatible with 2.x
# Environment
export PATH="$HOME/miniconda3/bin:$PATH"
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bash_profile
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda install pysam
