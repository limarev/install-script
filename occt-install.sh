#!/bin/bash
#mkdir $HOME/local/OpenCASCADE-7.4.0
#curl -L -o occt.tgz "http://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/V7_4_0;sf=tgz"
#tar zxf occt.tgz
#cd occt-V7_4_0
#mkdir build-occt
rm -rf -v $HOME/local/OpenCASCADE-7.4.0/*
rm -rf -v $HOME/Downloads/occt-V7_4_0/build-occt/*
cd $HOME/Downloads/occt-V7_4_0/build-occt
cmake \
	-DCMAKE_INSTALL_PREFIX=/home/limarev/local/OpenCASCADE-7.4.0 \
	-D3RDPARTY_FREETYPE_DIR:PATH=/home/limarev/local/freetype-2.10.0 \
	-DCMAKE_PREFIX_PATH=/home/limarev/local/freetype-2.10.0 \
	-DCMAKE_C_COMPILER=/home/limarev/local/gcc-5.5.0/bin/gcc \
	-DCMAKE_CXX_COMPILER=/home/limarev/local/gcc-5.5.0/bin/g++ \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_MODULE_Draw=1 \
	-DBUILD_MODULE_Visualization=1 \
	-DBUILD_MODULE_ApplicationFramework=1 ..

make -j12
make install
