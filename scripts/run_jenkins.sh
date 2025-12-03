#!/usr/bin/env bash

echo "=== Création des volumes Jenkins ==="
docker volume create jenkins_conf
docker volume create jenkins_data

echo "=== Lancement du conteneur Jenkins ==="
docker run -d \
  --name jenkins \
  --network bis_network \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_conf:/var/jenkins_conf \
  -v jenkins_data:/var/jenkins_home \
  jenkins/jenkins:lts

echo "=== Jenkins est (normalement) lancé sur : http://localhost:8080 ==="

