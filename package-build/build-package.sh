#!/bin/bash

SRC_DIR=$1

LIB='libcpr'

LIB_DIR="$LIB-$VERSION"
DEBIAN_DIR="$LIB_DIR/debian"

ARCHIVE_NAME="$LIB_DIR.tar.gz"

tar --exclude-vcs -czf $ARCHIVE_NAME $SRC_DIR
tar -xzf $ARCHIVE_NAME

cd $LIB_DIR

debmake -e 'philip.saendig@gmail.com' -f 'Philip Saendig'

cp -r package-build/debian-libcpr/* debian/

debuild


