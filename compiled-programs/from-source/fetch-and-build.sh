#!/bin/sh

[ -d "./fzy" ] || git clone git@github.com:gpanders/fzy.git fzy
cd fzy
git fetch origin multiselect:multiselect
git checkout multiselect
make clean
make
ln -sf "$PWD/fzy" ~/.local/bin/fzy
