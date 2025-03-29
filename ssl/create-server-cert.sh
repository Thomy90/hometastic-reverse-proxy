#!/bin/bash -e

(
    cd "$(dirname "$0")/certs"

    readonly domain="home.tastic"
    readonly serial_file="root-ca.srl"

    openssl req -new -sha256 -nodes -newkey rsa:2048 -keyout ${domain}.key -out ${domain}.csr -config ../${domain}.conf

    serial_option="-CAcreateserial"
    [ -f "${serial_file}" ] && serial_option="-CAserial ${serial_file}"

    openssl x509 -days 365 -req -in ${domain}.csr -out ${domain}.crt -CA root-ca.crt -CAkey root-ca.key ${serial_option} -extfile ../${domain}.conf -extensions v3_req
)
