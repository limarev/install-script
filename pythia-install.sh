#!/bin/bash
#Download the file pythia8243.tgz to a suitable location. Then do:
#tar xvfz pythia8243.tgz
rm -rf -v $HOME/local/pythia-8.2/*
cd ~/Downloads/pythia8243
make clean
~/Downloads/pythia8243/configure \ 
	--enable-shared \
	--enable-64bit \
	--prefix=/home/limarev/local/pythia-8.2 \
	--cxx=/home/limarev/local/gcc-5.5.0/bin/g++
make -j12
make install
#Add to .bashrc:
# pythia-8.2
#export PATH=$HOME/local/pythia-8.2/bin:$PATH
#export LD_LIBRARY_PATH=$HOME/local/pythia-8.2/lib:$LD_LIBRARY_PATH
