# traefik-acme
traefik only for acme certs generation

Reason: 

- You have multiple equal swarms and need to run multiple traefik-http-only instances as ingress
- You want to seperate certs-generation for the sake of high availability (ever ended up being rate-limited and then wanted to add another service?)
- You need https offloading by an external loadbalancer in front of the stack (certs from acme.json are extracted to that loadbalancer)
- Because certbot & co would cause double work on managing host lists and creating certs, why not use the traefik labels on services already available to generate acme certs with a single traefik instance, which only purpose is to generate certs and nothing else

This example is meant to be run on Docker Swarm.

### run the stack

```
docker swarm init

export DOMAIN=mydomain.com

bash run.sh
```

Traefik Dashboard is available at via swarm mesh at `:8080`
