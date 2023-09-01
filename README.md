# asphyxia-docker
---

Host Asphyxia CORE with all Asphyxia CORE plugins via Docker container

## Build Image
---

```
docker build --tag asphyxia .
```

## Run Docker Container
---

Two ports will be exposed:
- `8083` for API and WebUI
- `5700` for matching

```
docker run -p 8083:8083 -p 5700:5700 -d -v /your/asphyxia/save/folder/here:/mnt --name asphyxia asphyxia
```

Or download the `docker-compose.yml` file and run
```
docker compose up -d
```

## Configuration
---

The Docker container is going to contain the default `config.ini` file for server configuration.  
If you would like to customize it, then obtain the file by either downloading the `config.ini` file from this repository or running
```
docker container cp asphyxia:/asphyxia/config.ini .
```

Then, customize it and place it in `/your/asphyxia/save/folder/here` (the same folder used previously). Restart the container. The container should pull the config.ini file into asphyxia.

In the config file, you will be able to change a variety of options, but if you change the ports, be sure to change the exposed ports when starting the Docker container to match.
