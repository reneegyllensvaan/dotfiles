#!/bin/sh

# Build fxz
git submodule update fxz
cd fxz
./autogen.sh
./configure
make
make install
