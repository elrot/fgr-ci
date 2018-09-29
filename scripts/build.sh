#!/bin/sh

set -e

# task script is in resource-tutorial/job-inputs/ folder
# application input is in gopath/src/github.com/cloudfoundry-community/simple-go-web-app folder
# $GOPATH is gopath/ folder
ROOT=$(pwd)
export GOPATH=$ROOT/gopath

cd $ROOT/gopath/src/github.com/elrot/fgr/
gx install
GOOS=linux GOARCH=amd64 go build -o $ROOT/fogger-binaries cmd/foggerd/*.go

