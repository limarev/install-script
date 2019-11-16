#!/bin/bash
mkdir $HOME/local/lapack-3.8.0
#wget --directory-prefix=$HOME/Downloads http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
#tar -C $HOME/Downloads -xzf $HOME/Downloads/lapack-3.8.0.tar.gz
#	rm -rf -v $HOME/local/lapack-3.8.0/*
#rm -rf -v ~/Downloads/lapack-3.8.0/build/*
mkdir $HOME/Downloads/lapack-3.8.0/build-lapack
cd $HOME/Downloads/lapack-3.8.0/build-lapack
cmake .. \
	-DCMAKE_INSTALL_PREFIX=/home/limarev/local/lapack-3.8.0 \
	-DBUILD_SHARED_LIBS:BOOL=ON 
	# -DCMAKE_C_COMPILER:FILEPATH=/home/limarev/local/gcc-5.5.0/bin/gcc \
	# -DCMAKE_CXX_COMPILER:FILEPATH=/home/limarev/local/gcc-5.5.0/bin/g++ \
	# -DCMAKE_Fortran_COMPILER:FILEPATH=/home/limarev/local/gcc-5.5.0/bin/gfortran \

cmake --build . -- -j8
cmake --build . --target install
