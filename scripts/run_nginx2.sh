#!/usr/bin/env bash

docker run -d \
  --name nginx2 \
  --network bis_network \
  -p 8082:80 \
  -p 8444:443 \
  mynginx:v1
