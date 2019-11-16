#!/bin/bash
# rm -rf -v $INSTALL_DIR/*
# rm -rf -v $BUILD_DIR/*
PACKAGE=geant4
VERSION=10.5
URL=https://github.com/Geant4/geant4.git
INSTALL_DIR=$HOME/local/$PACKAGE-$VERSION
SOURCE_DIR=$HOME/Downloads/$PACKAGE-$VERSION
BUILD_DIR=$SOURCE_DIR/build-$PACKAGE-$VERSION
BIN_DIR=$INSTALL_DIR/bin
LIB_DIR=$INSTALL_DIR/lib

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
	-DGEANT4_INSTALL_DATA=ON \
	-DGEANT4_USE_QT=ON \
	-DGEANT4_USE_FREETYPE=ON



cmake --build $BUILD_DIR -- -j8
cmake --build $BUILD_DIR --target install

#Add to .bashrc:
# echo -e $'\nAdding '"$PACKAGE-$VERSION"' enviroment variables to .bashrc:\n'
# echo -e $'\n# '"$PACKAGE-$VERSION"'' >> $HOME/.bashrc
# echo -e $'export PATH='"$BIN_DIR"':$PATH' >> $HOME/.bashrc
# echo -e $'export LD_LIBRARY_PATH='"$LIB_DIR"':$LD_LIBRARY_PATH' >> $HOME/.bashrc

#	-DWITH_OCC:BOOL=FALSE \
#	-DWITH_VTK:BOOL=FALSE \
#	-DVTK_DIR:PATH=$HOME/local/VTK-5.10.1/lib/vtk-5.10 \
#	-DOCE_DIR:PATH=$HOME/local/OpenCASCADE-7.4.0/lib/cmake/opencascade 
	# -DCMAKE_C_COMPILER=$HOME/local/gcc-5.5.0/bin/gcc \
	# -DCMAKE_CXX_COMPILER=$HOME/local/gcc-5.5.0/bin/g++ \
	# -DCMAKE_Fortran_COMPILER=$HOME/local/gcc-5.5.0/bin/gfortran \


	# -DVTK_DIR:PATH=$HOME/local/VTK-5.10.1/lib/vtk-5.10 \
	# -DCMAKE_PREFIX_PATH=$HOME/local/qt-4.8.7
#	
# gedit /home/limarev/Downloads/build-elmer/post/src/CMakeFiles/QueryGLXExt.dir/link.txt
# gedit /home/limarev/Downloads/build-elmer/post/src/CMakeFiles/ElmerPost.dir/link.txt

