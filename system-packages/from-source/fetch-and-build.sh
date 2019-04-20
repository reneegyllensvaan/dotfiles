#!/bin/sh

# Build fxz
git submodule update --init fxz
cd fxz
./autogen.sh
./configure
make
make install
