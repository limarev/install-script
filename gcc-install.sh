#!/bin/bash
mkdir $HOME/local/gcc-5.5.0
cd ~/Downloads
wget https://ftp.gnu.org/gnu/gcc/gcc-5.5.0/gcc-5.5.0.tar.gz
tar xzf gcc-5.5.0.tar.gz
cd gcc-5.5.0
./contrib/download_prerequisites
cd ..
mkdir gcc-5.5.0-build
cd gcc-5.5.0-build
../gcc-5.5.0/configure \
			--prefix=/home/limarev/local/gcc-5.5.0 \
			--enable-languages=c,c++,fortran \
			--disable-multilib
make -j12
make install

#Create file .bashrc_original as a backup of file ".bashrc".
#Because we are going to change file ".bashrc".
#Add to ".bashrc":

# gcc-8.2.0
#export PATH=$HOME/local/gcc-8.2.0/bin:$PATH
#export LD_LIBRARY_PATH=$HOME/local/gcc-8.2.0/lib64:$LD_LIBRARY_PATH 

