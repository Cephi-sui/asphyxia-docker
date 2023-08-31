# debian was chosen for simplicity of development, this docker container would probably be better served by the use of Alpine Linux
FROM debian:latest

RUN apt update && \
    apt install -y wget git unzip

RUN mkdir /asphyxia && chown 1000:1000 /asphyxia

USER 1000

# Set up Asphyxia CORE
RUN cd /asphyxia && \
    wget https://github.com/asphyxia-core/asphyxia-core.github.io/releases/download/v1.50/asphyxia-core-linux-x64.zip && \
    unzip asphyxia-core-linux-x64.zip && \
    rm -rf asphyxia-core-linux-x64.zip

# Set up all Asphyxia CORE plugins
RUN cd /asphyxia && \
    git clone https://github.com/asphyxia-core/plugins plugins-git && \
    cp -r plugins-git/* plugins/. && \
    rm -rf plugins-git/

USER 0

# Remove unnecessary packages
RUN apt remove -y wget git unzip

# Expose server port and matching port
EXPOSE 8083
EXPOSE 5700

USER 1000

# Execute
CMD ["/asphyxia/asphyxia-core", "-d", "/mnt"]
