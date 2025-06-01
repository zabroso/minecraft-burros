#!/bin/bash

# Inicia ngrok en segundo plano
ngrok tcp --config /ngrok.yml 25565 &

# Espera 2 segundos para que ngrok inicie
sleep 2

# Llama al script de inicio oficial del contenedor (itzg/minecraft)
exec /start
