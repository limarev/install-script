#!/bin/bash
mkdir $HOME/local/MySQL-Server-8.0.18
git clone https://github.com/mysql/mysql-server.git
cd mysql-server
mkdir build
cd build

cmake .. \
	-DCMAKE_INSTALL_PREFIX=/home/limarev/local/MySQL-Server-8.0.18 \
	-DCMAKE_Fortran_COMPILER=/home/limarev/local/gcc-8.2.0/bin/gfortran \
	-DCMAKE_C_COMPILER=/home/limarev/local/gcc-8.2.0/bin/gcc \
	-DCMAKE_CXX_COMPILER=/home/limarev/local/gcc-8.2.0/bin/g++ \
	-DWITH_BOOST=
