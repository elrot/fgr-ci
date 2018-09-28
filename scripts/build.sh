#!/bin/sh

set -e

apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# task script is in resource-tutorial/job-inputs/ folder
# application input is in gopath/src/github.com/cloudfoundry-community/simple-go-web-app folder
# $GOPATH is gopath/ folder
export GOPATH=$(pwd)/gopath
export PATH=$PATH:$GOPATH/bin

cd gopath/src/github.com/elrot/fgr/

go get -u github.com/whyrusleeping/gx
go get -u github.com/whyrusleeping/gx-go

gx install

GOOS=linux GOARCH=amd64 go build -o .build/fogger cmd/foggerd/*.go