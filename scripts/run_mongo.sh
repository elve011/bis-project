#!/usr/bin/env bash

echo "=== Création du volume MongoDB ==="
docker volume create mongo_data

echo "=== Lancement du conteneur MongoDB ==="
docker run -d \
  --name mongo \
  --network bis_network \
  -p 27017:27017 \
  -v mongo_data:/data/db \
  mongo:latest

echo "=== MongoDB lancé sur : localhost:27017 ==="

