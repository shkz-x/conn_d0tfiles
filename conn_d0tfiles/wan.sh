#!/bin/bash

# Lee la dirección IP de la WAN desde el archivo
wan_ip=$(awk '{print $1}' /home/$USER/.config/bin/wan)

if [ "$wan_ip" ]; then
    echo "%{F#ff3399} WAN: %{F-}%{F#ffff00}$wan_ip%{u-}"
else
    echo "%{F#00ffff} WAN: %{u-}%{F#ffffff}"
fi