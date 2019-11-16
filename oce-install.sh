#!/bin/bash
#mkdir $HOME/local/OpenCASCADE_CE
#cd $HOME/Downloads
#git clone https://github.com/tpaviot/oce.git
#wget -P $HOME/Downloads https://github.com/tpaviot/oce/archive/OCE-0.14.tar.gz
#tar -C $HOME/Downloads -zxvf $HOME/Downloads/OCE-0.14.tar.gz
cd $HOME/Downloads
#mkdir build-oce-0.14
cd build-oce-0.14
rm -rf -v $HOME/local/OpenCASCADE_CE/*
rm -rf -v $HOME/Downloads/build-oce-0.14/*
cmake ../oce-OCE-0.14 \
	-DOCE_INSTALL_PREFIX=/home/limarev/local/OpenCASCADE_CE\
	-D3RDPARTY_FREETYPE_DIR:PATH=/home/limarev/local/freetype-2.10.0 \
	-DCMAKE_PREFIX_PATH=/home/limarev/local/freetype-2.10.0 \
	-DCMAKE_C_COMPILER=/home/limarev/local/gcc-5.5.0/bin/gcc \
	-DCMAKE_CXX_COMPILER=/home/limarev/local/gcc-5.5.0/bin/g++ \
	-DOCE_WITH_VTK:BOOL=ON \
	-DVTK_DIR:PATH=$HOME/local/VTK-5.10.1/lib/vtk-5.10/ \
	-DCMAKE_BUILD_TYPE=Release 

make -j12
make install
