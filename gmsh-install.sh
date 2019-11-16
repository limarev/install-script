#!/bin/bash
# rm -rf -v $INSTALL_DIR/*
# rm -rf -v $BUILD_DIR/*
PACKAGE=gmsh
VERSION=4.5.5
URL=http://gitlab.onelab.info/gmsh/gmsh.git
INSTALL_DIR=$HOME/local/$PACKAGE-$VERSION
SOURCE_DIR=$HOME/Downloads/$PACKAGE-$VERSION
BUILD_DIR=$SOURCE_DIR/build-$PACKAGE-$VERSION
BIN_DIR=$INSTALL_DIR/bin
LIB_DIR=$INSTALL_DIR/lib64

if [[ ! -d $SOURCE_DIR ]]; then
	echo "Downloading from '$URL' to: $INSTALL_DIR"
	git clone $URL $SOURCE_DIR
fi

if [[ ! -d $INSTALL_DIR ]]; then
	echo "Creating install directory: $INSTALL_DIR"
	mkdir $INSTALL_DIR
fi

if [[ ! -d $BUILD_DIR ]]; then
	echo "Creating build directory: $BUILD_DIR"
	mkdir $BUILD_DIR
fi

cmake -S $SOURCE_DIR -B $BUILD_DIR \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	-DLAPACK_lapack_LIBRARY:FILEPATH=/home/limarev/local/lapack-3.8.0/lib64/liblapack.so \
	-DBLAS_blas_LIBRARY:FILEPATH=/home/limarev/local/lapack-3.8.0/lib64/libblas.so \
	-DENABLE_BUILD_DYNAMIC=1 \
	-DENABLE_BUILD_LIB=1 \
	-DENABLE_BUILD_SHARED=1 
	# -DCMAKE_C_COMPILER=/home/limarev/local/gcc-5.5.0/bin/gcc \
	# -DCMAKE_CXX_COMPILER=/home/limarev/local/gcc-5.5.0/bin/g++ \
	# -DCMAKE_PREFIX_PATH=/home/limarev/local/freetype-2.10.0 \
	# -DCMAKE_PREFIX_PATH=/home/limarev/local/fltk-1.3.5 \
	# -DCMAKE_PREFIX_PATH=/home/limarev/local/OpenCASCADE-7.4.0 \
	# -DFREETYPE_INCLUDE_DIR_freetype2:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	# -DFREETYPE_INCLUDE_DIR_ft2build:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	# -DFREETYPE_LIBRARY_RELEASE:FILEPATH=/home/limarev/local/freetype-2.10.0/lib/libfreetype.so \

# Notes: 
# * if you installed dependencies (e.g. OpenCASCADE and FLTK) in non-standard locations, add the option -DCMAKE_PREFIX_PATH=path-of-installed-dependencies
# * to build a distributed memory (MPI) capable version add the option -DENABLE_MPI=1
# * to build the Gmsh app as well as the dynamic Gmsh library (to develop e.g. using the C++ or the Python Gmsh API), add the option -DENABLE_BUILD_DYNAMIC=1
# * for a list of all available configuration options see http://gmsh.info/doc/texinfo/gmsh.html#Compiling-the-source-code
cmake --build $BUILD_DIR -- -j8
cmake --build $BUILD_DIR --target install

#Add to .bashrc:
echo -e $'\nAdding '"$PACKAGE-$VERSION"' enviroment variables to .bashrc:\n'
echo -e $'\n# '"$PACKAGE-$VERSION"'' >> $HOME/.bashrc
echo -e $'export PATH='"$BIN_DIR"':$PATH' >> $HOME/.bashrc
echo -e $'export LD_LIBRARY_PATH='"$LIB_DIR"':$LD_LIBRARY_PATH' >> $HOME/.bashrc
