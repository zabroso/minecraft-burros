FROM itzg/minecraft-server:latest

COPY ngrok.yml /ngrok.yml
COPY start.sh /start-ngrok.sh
RUN chmod +x /start-ngrok.sh

# Instala ngrok
USER root
RUN apt-get update && \
    apt-get install -y unzip curl && \
    curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip && \
    unzip ngrok.zip && mv ngrok /usr/local/bin/ && rm ngrok.zip

# Usa el script personalizado como entrypoint
CMD ["/start-ngrok.sh"]
