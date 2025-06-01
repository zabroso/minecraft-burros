FROM itzg/minecraft-server:latest

# Copiar ngrok config
COPY ngrok.yml /ngrok.yml

# Instalar ngrok
USER root
RUN apt-get update && \
    apt-get install -y unzip curl && \
    curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip && \
    unzip ngrok.zip && mv ngrok /usr/local/bin/ && rm ngrok.zip

# Entrypoint para correr Minecraft y ngrok a la vez
CMD bash -c "ngrok tcp --config /ngrok.yml 25565 & /start"
