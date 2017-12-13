#!/bin/bash

brew update
brew install wget
# Install Python3
brew install python3
# Install perl
brew install perl
PATH=/usr/local/Cellar/perl/perl5/bin:$PATH
# Install pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
python get-pip.py
# Install R
brew install R
## Install Homer and cpanm
mkdir ~/homerdl
cd ~/homerdl
wget http://homer.ucsd.edu/homer/configureHomer.pl
# Install cpanm
~/perl5/bin/cpanm Statisics::R
# Install homer
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
# Install rpy
pip3 install rpy2 # Incompatible with 2.x
