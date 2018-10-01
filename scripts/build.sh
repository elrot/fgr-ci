#!/bin/sh

set -e

ROOT=$(pwd)
BIN=$ROOT/mister-binaries/mister


export GOPATH=$ROOT/gopath

cd $ROOT/gopath/src/github.com/elrot/mister/
gx install

DATE=$(date '+%Y%m%d%H%M%S')
COMMIT=$(git rev-parse --short HEAD)

build(){
    GOOS=$1
    GOARCH=$2
    ARCH=$3

    DIR=$BIN/$GOOS/static/nightly/$ARCH

    mkdir -p $DIR
    make build-tarball GOOS=$GOOS GOARCH=$GOARCH TARBALL=$DIR/mister-0.0.0-$DATE-$COMMIT.tar.gz
}

build linux 386 x86
build linux amd64 x86_64
build linux arm armhf
build linux arm64 aarch64
build linux ppc64le ppc64le
build linux s390x s390x
build darwin amd64 x86_64