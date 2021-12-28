#!/bin/bash

# Export .env variables
export $(grep -v '^#' .env | xargs)

# Create bouncer network
docker network create governify-services

# Docker compose
docker-compose --env-file ./.env up -d

# Create dummy certificates
./utils/init-letsencrypt.sh 1 1

echo -e "\033[33m
                 **************************************************************
                 ****              WARNING: CPU LIMITS.                    ****
                 ****        None of the containers have CPU limits.       ****
                 ****        If you need to add those limits, do it        ****
                 ****        in the required compose files.                ****
                 **************************************************************\033[0m\n"
