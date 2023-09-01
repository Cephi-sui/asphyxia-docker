# debian was chosen for simplicity of development, this docker container would probably be better served by the use of Alpine Linux
FROM debian:latest

RUN apt update && \
    apt install -y wget git unzip

RUN mkdir /asphyxia

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

# Remove unnecessary packages
RUN apt remove -y wget git unzip

# Expose server port and matching port
EXPOSE 8083
EXPOSE 5700

# Execute
CMD ["sh", "-c", "if [ -e /mnt/config.ini ]; then cp /mnt/config.ini /asphyxia/config.ini; fi && /asphyxia/asphyxia-core -d /mnt/savedata"]
