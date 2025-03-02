#!/bin/bash

pushd "$(dirname "$0")" > /dev/null
cd certs

openssl req -new -sha256 -nodes -newkey rsa:2048 -keyout server.key -out server.csr -config ../home-tastic.conf
openssl x509 -days 365 -req -in server.csr -out server.crt -CA root-ca.crt -CAkey root-ca.key -CAcreateserial -extfile ../home-tastic.conf -extensions v3_req

popd > /dev/null
