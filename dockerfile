# Use an alpine image
FROM alpine:3.22

# Install prerequisites
RUN apk update && \
    apk upgrade --no-cache && \
    apk add bash curl git ca-certificates

# Set desired versions
ENV VERSION="1.3.0"

RUN curl -LO "https://github.com/oras-project/oras/releases/download/v${VERSION}/oras_${VERSION}_linux_amd64.tar.gz" && \
    mkdir -p oras-install && \
    tar -zxf oras_${VERSION}_*.tar.gz -C oras-install && \
    mv oras-install/oras /usr/local/bin && \
    rm -rf oras_${VERSION}_*.tar.gz oras-install

RUN oras version