FROM alpine:latest
FROM golang:1.18.2-alpine
 
COPY --from=golang:1.18.2-alpine /usr/local/go/ /usr/local/go/
 
ENV PATH="/usr/local/go/bin:${PATH}"

RUN apk update
RUN apk add curl tar wget clang pkgconfig libressl-dev jq alpine-sdk bash 
RUN rm -rf celestia-node && git clone https://github.com/celestiaorg/celestia-node.git && cd celestia-node && git checkout tags/v0.3.0-rc2 && make install && make cel-key && celestia light init