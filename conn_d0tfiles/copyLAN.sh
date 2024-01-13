#!/bin/bash

# Obtengo la IP del archivo LAN
ip_address=$(cat /home/$USER/.config/bin/lan | awk '{print $1}')

# Copio sin dejar salto de linea
echo -n "$ip_address" | xclip -sel clip

# Notifico IP copiada
notify-send "[LAN Copied]" "IP: $ip_address"

