#!/bin/bash

# Obtengo la IP del archivo TARGET
ip_address=$(cat /home/$USER/.config/bin/vpn | awk '{print $1}')

# Copio sin dejar salto de linea
echo -n "$ip_address" | xclip -sel clip

# Notifico IP copiada
notify-send "[VPN Copied]" "IP: $ip_address"
