#!/bin/bash
#mkdir $HOME/local/freetype-2.10.0
#curl -O http://download.savannah.gnu.org/releases/freetype/freetype-2.10.0.tar.gz
#tar zxvf freetype-2.10.0.tar.gz
rm -rf -v $HOME/local/freetype-2.10/*
cd ~/Downloads/freetype-2.10.0
make clean
./configure \
	--prefix=$HOME/local/freetype-2.10.0 \
	CC=$HOME/local/gcc-5.5.0/bin/gcc

make -j12
make install
