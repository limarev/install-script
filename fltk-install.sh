#!/bin/bash
#mkdir $HOME/local/fltk-1.3.5
#curl -O http://fltk.org/pub/fltk/1.3.5/fltk-1.3.5-source.tar.gz
#tar zxvf fltk-1.3.5-source.tar.gz
PACKAGE=fltk
VERSION=1.3.5
URL=https://github.com/fltk/fltk.git
INSTALL_DIR=$HOME/local/$PACKAGE-$VERSION
SOURCE_DIR=$HOME/Downloads/$PACKAGE-$VERSION
BUILD_DIR=$SOURCE_DIR/build-$PACKAGE

if [[ ! -d $SOURCE_DIR ]]; then
	echo "Downloading from '$URL' to: $SOURCE_DIR/.."
	git $URL $SOURCE_DIR
fi

if [[ ! -d $INSTALL_DIR ]]; then
	echo "Creating install directory: $INSTALL_DIR"
	mkdir $INSTALL_DIR
fi

if [[ ! -d $BUILD_DIR ]]; then
	echo "Creating build directory: $BUILD_DIR"
	mkdir $BUILD_DIR
fi
#rm -rf -v $HOME/local/fltk-1.3.5/*
#make clean
#cd fltk-1.3.5
./configure $SOURCE_DIR \
	--prefix=$INSTALL_DIR \
	CFLAGS='-fPIC' \
	CXXFLAGS='-fPIC' 

make -j8
make install
