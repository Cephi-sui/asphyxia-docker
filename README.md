asphyxia-docker
===

Host Asphyxia CORE with all Asphyxia CORE plugins via Docker container

To build image
---

```
docker build --tag asphyxia:1.50c .
```

To run
---

Two ports will be exposed:
- `8083` for API and WebUI
- `5700` for matching

```
docker run -p 8083:8083 -p 5700:5700 -d --name asphyxia asphyxia:1.50c
```

Or download the `docker-compose.yml` file and run
```
docker compose up -d
```
