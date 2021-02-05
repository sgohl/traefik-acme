#!/bin/bash

if [[ ! -f acme/acme.json ]]
then
	mkdir -p acme
	touch acme/acme.json
	chmod 600 acme/acme.json
fi

docker network create --driver=overlay traefik

docker stack rm infra

sed -i "s/XXDOMAINXX/${DOMAIN}/g" traefik.yml

docker stack deploy -c docker-compose.yml infra
