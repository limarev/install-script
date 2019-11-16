#!/bin/bash
wget --directory-prefix=$HOME/Downloads https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0-6.0.14_133895_el7-1.x86_64.rpm
sudo yum --nogpgcheck localinstall VirtualBox-6.0-6.0.14_133895_el7-1.x86_64.rpm
sudo yum --nogpgcheck install VirtualBox-6.0-6.0.14_133895_el7-1.x86_64.rpm 
sudo yum install kernel-devel
sudo yum install akmods.noarch

su -
mkdir /root/module-signing
cd /root/module-signing
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"
mokutil --import /root/module-signing/MOK.der


for f in $(dirname $(modinfo -n vboxdrv))/*.ko; do echo "Signing $f"; sudo /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 /root/module-signing/MOK.priv /root/module-signing/MOK.der $f; done