#!/bin/bash

INSTALL_DIR=$HOME/local/garfield++
SOURCE_DIR=$HOME/Downloads/garfieldpp
BUILD_DIR=$SOURCE_DIR/build-garfield

if [[ ! -d $SOURCE_DIR ]]; then
	echo "Downloading from 'https://gitlab.cern.ch/garfield/garfieldpp.git' to: $INSTALL_DIR"
	git clone https://gitlab.cern.ch/garfield/garfieldpp.git $SOURCE_DIR
fi

if [[ ! -d $INSTALL_DIR ]]; then
	echo "Creating install directory: $INSTALL_DIR"
	mkdir $INSTALL_DIR
fi

if [[ ! -d $BUILD_DIR ]]; then
	echo "Creating build directory: $BUILD_DIR"
	mkdir $BUILD_DIR
fi

# #rm -rf -v $HOME/local/garfield++/*
# #rm -rf -v $HOME/Downloads/garfieldpp/build/*

cmake -S $SOURCE_DIR -B $BUILD_DIR \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	-DROOT_DIR:PATH=/home/limarev/local/root-6.18.00/cmake \
	-DWITH_DOCS=ON \
	-DWITH_EXAMPLES=ON 
cmake --build . -- -j8
cmake --build . --target install

#Add to .bashrc:
echo -e $'\nAdding garfield++ enviroment variables to .bashrc:\n'
echo -e $'\n# garfield++' >> $HOME/.bashrc
echo -e $'export GARFIELD_HOME='"$INSTALL_DIR"$'' >> $HOME/.bashrc
echo -e $'export HEED_DATABASE=$GARFIELD_HOME/Heed/heed++/database' >> $HOME/.bashrc
echo -e $'export LD_LIBRARY_PATH=$GARFIELD_HOME/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
