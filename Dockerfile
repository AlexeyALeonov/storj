FROM golang:1.11 as builder
RUN git clone https://github.com/storj/storj -b master
RUN cd storj && go install -v ./...

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /storj/
COPY --from=builder /go/bin /bin
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
