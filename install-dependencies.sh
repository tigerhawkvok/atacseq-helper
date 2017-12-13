#!/bin/bash
#####################
# Have you read the README?
#
# Make sure you do so that your system is ready
# to run this file! Just one or two commands
# that are platform-specific.
#####################
brew update
brew install wget
# Install Python3
brew install python3
# Install perl
brew install perl
PATH=/usr/local/Cellar/perl/perl5/bin:$PATH
echo 'export PATH="/usr/local/Cellar/perl/perl5/bin:$PATH"' >> ~/.bash_profile
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
brew install llvm
echo /usr/local/opt/llvm/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/llvm.pth
mkdir -p ~/Library/Python/2.7/lib/python/site-packages
echo 'import site; site.addsitedira("/usr/local/lib/python2.7/site-packages")' >> ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH="/usr/local/opt/llvm/lib:$LD_LIBRARY_PATH"' >> ~/.bash_profile
echo 'export LIBRARY_PATH="/usr/local/opt/llvm/lib:$LIBRARY_PATH"' >> ~/.bash_profile
export PATH=/usr/local/opt/llvm/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/opt/llvm/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/opt/llvm/lib:$LIBRARY_PATH
pip3 install rpy2 # Incompatible with 2.x
# Environment
alias python=python3
echo 'alias python=python3' >> ~/.bash_profile # Really, it's 2017, you shouldn't be running Python 2.x
