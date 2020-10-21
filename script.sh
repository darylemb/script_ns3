#!/bin/bash
#!chmod -775 script.sh
cd ~
sudo apt install git
sudo apt install gcc
sudo apt install g++
sudo apt update
if [ -d ns-3-allinone ]
then 
	echo "Borrando carpeta preexistente"
	rm -r ns-3-allinone
fi
git clone https://gitlab.com/nsnam/ns-3-allinone.git
cd ns-3-allinone
python3 download.py
cd ns-3-dev
./waf clean
CXXFLAGS="-W -Wall -g" ./waf configure --disable-examples --disable-tests
./waf build
