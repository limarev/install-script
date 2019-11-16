#!/bin/bash
# rm -rf -v $INSTALL_DIR/*
# rm -rf -v $BUILD_DIR/*
PACKAGE=Elmer
VERSION=8.4
URL=git://www.github.com/ElmerCSC/elmerfem
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
	-DWITH_ELMERGUI:BOOL=TRUE \
	-DWITH_ELMERPOST:BOOL=TRUE \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	-DWITH_MPI:BOOL=TRUE\
	-DMPI_C_COMPILER:FILEPATH=/home/limarev/local/mpich-3.3.1/bin/mpicc \
	-DMPI_C_INCLUDE_PATH:STRING=$HOME/local/mpich-3.3.1/include \
	-DMPI_C_LIBRARIES:STRING=$HOME/local/mpich-3.3.1/lib/libmpi.so \
	-DMPI_CXX_COMPILER:FILEPATH=/home/limarev/local/mpich-3.3.1/bin/mpicxx \
	-DMPI_CXX_INCLUDE_PATH:STRING=$HOME/local/mpich-3.3.1/include \
	-DMPI_CXX_LIBRARIES:STRING=$HOME/local/mpich-3.3.1/lib/libmpicxx.so \
	-DMPI_Fortran_COMPILER:FILEPATH=$HOME/local/mpich-3.3.1/bin/mpifort \
	-DMPI_Fortran_INCLUDE_PATH:STRING=$HOME/local/mpich-3.3.1/include \
	-DMPI_Fortran_LIBRARIES:STRING=$HOME/local/mpich-3.3.1/lib/libmpifort.so \
	-DMPIEXEC:FILEPATH=$HOME/local/mpich-3.3.1/bin/mpiexec \
	-DLAPACK_lapack_LIBRARY:FILEPATH=$HOME/local/lapack-3.8.0/lib64/liblapack.so \
	-DBLAS_blas_LIBRARY:FILEPATH=/home/limarev/local/lapack-3.8.0/lib64/libblas.so \
	-DWITH_VTK:BOOL=FALSE \
	-DVTK_DIR:PATH=$HOME/local/VTK-5.10.1/lib64/vtk \
	-DCMAKE_EXE_LINKER_FLAGS='-lX11' 


cmake --build $BUILD_DIR -- -j8
cmake --build $BUILD_DIR --target install

#Add to .bashrc:
echo -e $'\nAdding '"$PACKAGE-$VERSION"' enviroment variables to .bashrc:\n'
echo -e $'\n# '"$PACKAGE-$VERSION"'' >> $HOME/.bashrc
echo -e $'export PATH='"$BIN_DIR"':$PATH' >> $HOME/.bashrc
echo -e $'export LD_LIBRARY_PATH='"$LIB_DIR"':$LD_LIBRARY_PATH' >> $HOME/.bashrc

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

