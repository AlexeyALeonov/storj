FROM golang:1.11 as builder
RUN git clone https://github.com/storj/storj -b master
RUN cd storj && make install-sim

FROM frolvlad/alpine-miniconda2
RUN apk --no-cache add ca-certificates
WORKDIR /storj/
COPY --from=builder /go/bin /bin
RUN storj-sim network setup
RUN sed -i 's/server.address: \"127.0.0.1:9000\"/server.address: \":9000\"/g' /root/.local/share/storj/local-network/gateway/0/config.yaml
RUN sed -i 's/server.address: \"127.0.0.1:10000\"/server.address: \":10000\"/g' /root/.local/share/storj/local-network/satellite/0/config.yaml
COPY uplink-configure.sh .
RUN chmod +x uplink-configure.sh

EXPOSE 9000

ENTRYPOINT [ "storj-sim", "network", "run" ]