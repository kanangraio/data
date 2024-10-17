#!/usr/bin/env bash


source .env

if [ ! -f "ca.pem" ]; then
  echo "Generating TLS keys"
  openssl genrsa 2048 > ca-key.pem
  openssl req -new -x509 -nodes -days 3650 -key ca-key.pem -out ca.pem -subj "/CN=MySQL_CA"
  openssl genrsa 2048 > server-key.pem
  openssl req -new -key server-key.pem -out server-req.pem -config openssl.cnf
  openssl x509 -req -in server-req.pem -days 3650 -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extensions req_ext -extfile openssl.cnf
  chmod 600 server-key.pem
  chmod 600 ca.pem
  chmod 600 server-cert.pem
fi

# Update

docker build --platform linux/amd64 -t ${USERNAME}/${REPOSITORY}:${TAG} .
#docker buildx build --platform linux/amd64,linux/arm64 -t ${USERNAME}/${REPOSITORY}:${TAG} $* .

