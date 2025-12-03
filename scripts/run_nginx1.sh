#!/usr/bin/env bash

docker run -d \
  --name nginx1 \
  --network bis_network \
  -p 8081:80 \
  -p 8443:443 \
  mynginx:v1
