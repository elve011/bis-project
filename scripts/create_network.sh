#!/usr/bin/env bash

# Crée le réseau Docker pour tout le projet
docker network create bis_network || echo "Le réseau bis_network existe déjà"
