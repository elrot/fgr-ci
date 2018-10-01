#!/bin/sh

set -e

ROOT=$(pwd)
export GOPATH=$ROOT/gopath

cd $ROOT/gopath/src/github.com/elrot/mister/
gx install
GOOS=linux GOARCH=amd64 go build -o $ROOT/mister-binaries/misterd cmd/misterd/*.go

