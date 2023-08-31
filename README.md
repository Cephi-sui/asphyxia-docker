# asphyxia-docker
===

Host Asphyxia CORE with all Asphyxia CORE plugins via Docker container

## Build Image
---

```
docker build --tag asphyxia:1.50c .
```

## Run Docker Container
---

Two ports will be exposed:
- `8083` for API and WebUI
- `5700` for matching

```
docker run -p 8083:8083 -p 5700:5700 -d -v /your/asphyxia/folder/here:/mnt --name asphyxia asphyxia:1.50c
```

Or download the `docker-compose.yml` file and run
```
docker compose up -d
```

## Configuration
---

After the Docker container is run for the first time, `config.ini` will appear in `/your/asphyxia/folder/here`.

You will be able to change a variety of options, but if you change the ports, be sure to change the exposed ports when starting the Docker container to match.
