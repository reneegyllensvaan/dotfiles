#!/bin/sh

[ -d "./fzy" ] || git clone git@github.com:gpanders/fzy.git fzy
cd fzy
git fetch origin multiselect:multiselect
git checkout multiselect
make clean
make
ln -sf "$PWD/fzy" ~/.local/bin/fzy

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
