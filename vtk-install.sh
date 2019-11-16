#!/bin/bash
#mkdir $HOME/local/VTK-5.10.1
#git clone https://github.com/rmeruane/VTK5.10.1.git
#mkdir build
#cd build
# for gcc-8.2.0 - is not working
#cmake \
	-DQT_QMAKE_EXECUTABLE:PATH=$HOME/local/qt-4.8.7/bin/qmake \
    -DVTK_Group_Qt:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX=$HOME/local/VTK-5.10.1 \
    -DCMAKE_C_COMPILER=$HOME/local/gcc-8.2.0/bin/gcc \
	-DCMAKE_CXX_COMPILER:FILEPATH=$HOME/local/gcc-8.2.0/bin/g++ \
	-DFREETYPE_INCLUDE_DIR_freetype2:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	-DFREETYPE_INCLUDE_DIR_ft2build:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	-DFREETYPE_LIBRARY_RELEASE:FILEPATH=/home/limarev/local/freetype-2.10.0/lib/libfreetype.so \
	-DCMAKE_CXX_FLAGS=-Wnarrowing \
    ..
# for gcc-4.8.5 -is working
rm -rf -v $HOME/local/VTK-5.10.1/*
rm -rf -v $HOME/Downloads/VTK5.10.1/build/*
cd $HOME/Downloads/VTK5.10.1/build
cmake \
	-DQT_QMAKE_EXECUTABLE:PATH=$HOME/local/qt-4.8.7/bin/qmake \
    -DVTK_Group_Qt:BOOL=ON \
    -DVTK_USE_Qt:BOOL=ON \
    -DVTK_USE_QT:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX=$HOME/local/VTK-5.10.1 \
    -DCMAKE_C_COMPILER=$HOME/local/gcc-5.5.0/bin/gcc \
	-DCMAKE_CXX_COMPILER:FILEPATH=$HOME/local/gcc-5.5.0/bin/g++ \
	-DFREETYPE_INCLUDE_DIR_freetype2:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	-DFREETYPE_INCLUDE_DIR_ft2build:PATH=/home/limarev/local/freetype-2.10.0/include/freetype2 \
	-DFREETYPE_LIBRARY_RELEASE:FILEPATH=/home/limarev/local/freetype-2.10.0/lib/libfreetype.so \
    ..
make -j12
make install
