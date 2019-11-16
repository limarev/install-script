#!/bin/bash
# rm -rf -v $INSTALL_DIR/*
# rm -rf -v $BUILD_DIR/*
PACKAGE=mpich
VERSION=3.3.1
URL=http://www.mpich.org/static/downloads/3.3.1/mpich-3.3.1.tar.gz 
INSTALL_DIR=$HOME/local/$PACKAGE-$VERSION
SOURCE_DIR=$HOME/Downloads/$PACKAGE-$VERSION
BUILD_DIR=$SOURCE_DIR
BIN_DIR=$INSTALL_DIR/bin
LIB_DIR=$INSTALL_DIR/lib

if [[ ! -d $SOURCE_DIR ]]; then
	echo "Downloading from '$URL' to: $INSTALL_DIR"
	wget -P $SOURCE_DIR/.. $URL
	tar -C $SOURCE_DIR -xzvf $SOURCE_DIR/../mpich-3.3.1.tar.gz --strip-components=1
fi

if [[ ! -d $INSTALL_DIR ]]; then
	echo "Creating install directory: $INSTALL_DIR"
	mkdir $INSTALL_DIR
fi
# enter $SOURCE_DIR
make -C $SOURCE_DIR clean
$SOURCE_DIR/configure --srcdir=$SOURCE_DIR \
	--prefix=$INSTALL_DIR 2>&1 | tee c.txt
	# CC=$HOME/local/gcc-5.5.0/bin/gcc \
	# CXX=$HOME/local/gcc-5.5.0/bin/g++ \
	# F77=$HOME/local/gcc-5.5.0/bin/gfortran \
	# FC=$HOME/local/gcc-5.5.0/bin/gfortran

make -C $SOURCE_DIR -j8 2>&1 | tee m.txt
make -C $SOURCE_DIR install 2>&1 | tee mi.txt

#Add to .bashrc:
echo -e $'\nAdding '"$PACKAGE-$VERSION"' enviroment variables to .bashrc:\n'
echo -e $'\n# '"$PACKAGE-$VERSION"'' >> $HOME/.bashrc
echo -e $'export PATH='"$BIN_DIR"':$PATH' >> $HOME/.bashrc
echo -e $'export LD_LIBRARY_PATH='"$LIB_DIR"':$LD_LIBRARY_PATH' >> $HOME/.bashrc
