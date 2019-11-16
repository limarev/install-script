#!/bin/bash
sudo yum -y install \
		mc \
		centos-release-scl-rh \
		devtoolset-8-gcc* \
		rh-python36 \
		google-chrome-stable_current_x86_64.rpm \
		libXpm-devel.x86_64 \
		freetype-devel.x86_64 \
		libXft-devel.x86_64 \
		libXext-devel.x86_64 \
		git-all.noarch \
		gtk2-devel.x86_64 \
		fltk-devel.x86_64 \
		freeglut-devel.x86_64 \
		qt-devel.x86_64 \
		vtk-qt.x86_64 \
		tcl-devel.x86_64 \
		tk-devel.x86_64 \
		kernel-devel 
