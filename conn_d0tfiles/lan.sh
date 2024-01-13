#!/bin/bash

# Lee la dirección IP de la LAN desde el archivo
lan_ip=$(awk '{print $1}' /home/$USER/.config/bin/lan)

if [ "$lan_ip" ]; then
    echo "%{F#ff3399} LAN: %{F-}%{F#ffff00}$lan_ip%{u-}"
else
    echo "%{F#00ffff} LAN: %{u-}%{F#ffffff}"
fi
