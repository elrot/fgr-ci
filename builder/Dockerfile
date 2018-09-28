FROM golang:1.10-alpine
RUN  apk add --no-cache git && \
     go get -u github.com/whyrusleeping/gx && \
     go get -u github.com/whyrusleeping/gx-go && \
     rm -rf /go/src && mkdir /go/src
     
    