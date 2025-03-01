#!/bin/sh

docker network create --opt com.docker.network.bridge.name=reverse-proxy reverse-proxy
