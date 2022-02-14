#!/bin/sh
base=$PWD

cd $base
if [ ! -e ./fzy ]; then
  [ -d "./fzy" ] || git clone git@github.com:gpanders/fzy.git fzy
  cd fzy
  git fetch origin multiselect:multiselect
  git checkout multiselect
  make clean
  make
  ln -sf "$PWD/fzy" ~/.local/bin/fzy
fi

cd $base
if [ ! -e ./ii ]; then
  git clone https://git.suckless.org/ii
  cd ii
  git checkout 1.8
  git apply << EOF
diff --git a/Makefile b/Makefile
index 8e0d89d..660530c 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
# See LICENSE file for copyright and license details.
include config.mk

-SRC = ii.c strlcpy.c
+SRC = ii.c
OBJ = \${SRC:.c=.o}

all: ii
EOF
  make install
fi


cd $base
if [ ! -e ./scdoc ]; then
  git clone https://git.sr.ht/~sircmpwn/scdoc
  cd scdoc
  make
  sudo make install
fi

cd $base
if [ ! -e ./aerc ]; then
  git clone https://git.sr.ht/~sircmpwn/aerc
  cd aerc
  GOFLAGS=-tags=notmuch make
  make install
fi
