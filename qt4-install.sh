#!/bin/bash
#wget https://download.qt.io/archive/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.tar.gz
#gunzip qt-everywhere-opensource-src-4.8.7.tar.gz
#tar xf qt-everywhere-opensource-src-4.8.7.tar
#mkdir $HOME/local/qt-4.8.7
rm -rf -v $HOME/local/qt-4.8.7/*
cd ~/Downloads/qt-everywhere-opensource-src-4.8.7
make clean
./configure \
	-opensource \
	-no-javascript-jit \
	-no-webkit \
	-no-sql-mysql \
	--prefix=$HOME/local/qt-4.8.7 
make -j12
make install
