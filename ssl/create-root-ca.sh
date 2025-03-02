#!/bin/bash

pushd "$(dirname "$0")" > /dev/null
cd certs

openssl req -x509 -nodes -days 5000 -newkey rsa:2048 -keyout root-ca.key -out root-ca.crt

popd > /dev/null
