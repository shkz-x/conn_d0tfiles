#!/bin/bash

# Lee la dirección IP y el nombre de la máquina desde el archivo
ip_address=$(awk '{print $1}' /home/$USER/.config/bin/target)
machine_name=$(awk '{print $2}' /home/$USER/.config/bin/target)

# Comprueba si al menos uno de los dos está presente
if [ "$ip_address" ] || [ "$machine_name" ]; then
    echo "%{F#ff3399} TARGET: %{F-}%{F#ffee00}$ip_address%{u-} $machine_name%{F-}"
else
    echo "%{F#00ffff} TARGET: %{u-}%{F#ffee00} "
fi

