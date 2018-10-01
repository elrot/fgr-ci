#!/bin/sh

set -e

ROOT=$(pwd)
BIN=$ROOT/mister-binaries/mister/


export GOPATH=$ROOT/gopath

cd $ROOT/gopath/src/github.com/elrot/mister/
gx install

DATE=$(date '+%Y%m%d%H%M%S')
COMMIT=$(git rev-parse --short HEAD)

make build-tarball GOOS=linux GOARCH=386 TARBAL=$BIN/linux/static/nightly/x86/mister-0.0.0-$DATE-$COMMIT.tar.gz
make build-tarball GOOS=linux GOARCH=amd64 TARBAL=$BIN/linux/static/nightly/x86_64/mister-0.0.0-$DATE-$COMMIT.tar.gz
make build-tarball GOOS=linux GOARCH=arm TARBAL=$BIN/linux/static/nightly/armhf/mister-0.0.0-$DATE-$COMMIT.tar.gz
make build-tarball GOOS=linux GOARCH=arm64 TARBAL=$BIN/linux/static/nightly/aarch64/mister-0.0.0-$DATE-$COMMIT.tar.gz
