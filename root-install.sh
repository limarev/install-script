#!/bin/bash
#wget --directory-prefix=$HOME/Downloads https://root.cern.ch/download/root_v6.18.00.source.tar.gz
#tar -C $HOME/Downloads -zxf $HOME/Downloads/root_v6.18.00.source.tar.gz
#mkdir $HOME/local/root-6.18.00
#mkdir $HOME/Downloads/build-root/
#rm -rf -v $HOME/local/root-6.18.00/*
#rm -rf -v $HOME/Downloads/build-root/*
cd ~/Downloads/build-root
cmake ../root-6.18.00/ \
	-DCMAKE_INSTALL_PREFIX=/home/limarev/local/root-6.18.00 \
	-DLAPACK_lapack_LIBRARY:FILEPATH=/home/limarev/local/lapack-3.8.0/lib64/liblapack.so \
	-DBLAS_blas_LIBRARY:FILEPATH=/home/limarev/local/lapack-3.8.0/lib64/libblas.so 
	# -DFREETYPE_LIBRARY_RELEASE:FILEPATH=/usr/lib64/libfreetype.so
	# -DCMAKE_Fortran_COMPILER=/home/limarev/local/gcc-5.5.0/bin/gfortran \
	# -DCMAKE_C_COMPILER=/home/limarev/local/gcc-5.5.0/bin/gcc \
	# -DCMAKE_CXX_COMPILER=/home/limarev/local/gcc-5.5.0/bin/g++ \
	# -DPYTHIA8_DIR:PATH=/home/limarev/local/pythia-8.2 \
	# -DPYTHIA8_INCLUDE_DIR:PATH=/home/limarev/local/pythia-8.2/include \
	# -DPYTHIA8_LIBRARY:FILEPATH=/home/limarev/local/pythia-8.2/lib/libpythia8.so \
	# -DCMAKE_PREFIX_PATH=/home/limarev/local/freetype-2.10.0 \

cmake --build . -- -j8
cmake --build . --target install

#Add to .bashrc:
# root-6.18.00
#export ROOTSYS=$HOME/local/root-6.18.00
#export PATH=$ROOTSYS/bin:$PATH
#export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH

