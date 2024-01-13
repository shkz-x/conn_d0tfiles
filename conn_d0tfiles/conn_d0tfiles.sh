#!/bin/bash
# _*_ Coding:UTF8_*_
# By shkz | MyHack.tech


# Path User Home
USER_HOME="/home/$USER"
# Path to .zshrc
ZSHRC_FILE="$USER_HOME/.zshrc"
# Path to BIN folder
BIN_FOLDER="/home/$USER/.config/bin"
# Path to config.ini
CONFIG_INI="/home/$USER/.config/bspwm/rices/jan/config.ini"


# Check for xclip and libnoftify packages
if ! pacman -Q xclip &>/dev/null || ! pacman -Q libnotify &>/dev/null; then
    echo -e "[*] Checking for xclip and libnotify packages\n"
    sudo pacman -S --noconfirm xclip libnotify
else
    echo "[*] xclip and libnotify are already installed."
fi

# If not exist, make it.
if [ ! -d "$BIN_FOLDER" ]; then
    echo "[*] Creating folder: bin -> /home/$USER/.config/"
    sleep 1
    mkdir -p "$BIN_FOLDER"
else
    echo "bin/ folder exists!, moving on.."
fi

echo "[*] Creating necessary files in -> /home/$USER/.config/bin/"

# Creating necessary files
touch "$BIN_FOLDER/htb"
touch "$BIN_FOLDER/lan"
touch "$BIN_FOLDER/target"
touch "$BIN_FOLDER/vpn"
touch "$BIN_FOLDER/wan"
sleep 1

# Check if exists modules_ini
MODULES_INI="$HOME/.config/bspwm/rices/jan/modules.ini"
if [ -f "$MODULES_INI" ]; then

    # Writing config to Modules.ini
    cat <<EOF >> "$MODULES_INI"
######################### TARGET #########################

[module/mytarget]
type = custom/script
interval = 2
exec = $BIN_FOLDER/mytarget.sh
click-left = $BIN_FOLDER/copyTarget.sh

######################### VPN IP #############################

[module/vpn]
type = custom/script
interval = 2
exec = $BIN_FOLDER/vpn.sh
click-left = $BIN_FOLDER/copyVPN.sh

######################### WAN IP ######################

[module/wan]
type = custom/script
interval = 2
exec = $BIN_FOLDER/wan.sh
click-left = $BIN_FOLDER/copyWAN.sh

######################### LAN IP ######################

[module/lan]
type = custom/script
interval = 2
exec = $BIN_FOLDER/lan.sh
click-left = $BIN_FOLDER/copyLAN.sh

########################################################
EOF

else
    echo "¡Error! File $MODULES_INI doesn't exist."
    break
fi

# Editing config.ini to enable modules
SEARCH_STRING="modules-center = title"
REPLACE_STRING="modules-center = vpn mytarget lan wan"

# Check if config.ini exists
if [ -f "$CONFIG_INI" ]; then
    # Replace modules
    sed -i "s/$SEARCH_STRING/$REPLACE_STRING/" "$CONFIG_INI"
    echo "[*] Enabling modules in => $CONFIG_INI"
else
    echo "¡Error! File $CONFIG_INI doesn't exist."
fi
sleep 1

# Append functions to .zshrc
cat <<EOF >> "$ZSHRC_FILE"
#========================================= WAN
function wanon(){
   curl -s ifconfig.me > "$BIN_FOLDER/wan"
}

function wanoff(){
    echo "" > "$BIN_FOLDER/wan"
}

#========================================= GET-LAN-IP
function lanon(){

    # Detect interface
    ip -4 addr show scope global | grep inet | awk '{print \$2}' | cut -d'/' -f1 > "$BIN_FOLDER/lan"
}

function lanoff(){
    echo "" > "$BIN_FOLDER/lan"
}
#========================================= GET-VPN-IP
function von(){
    ip -o -4 addr list tun0 | awk '{print \$4}' | cut -d/ -f1 > "$BIN_FOLDER/vpn"
}

function voff(){
    echo "" > "$BIN_FOLDER/vpn"
}
#========================================= SET & UNSET TARGET
function target(){
    ip_address=\$1
    machine_name=\$2
    echo "\$ip_address \$machine_name" > "$BIN_FOLDER/target"
}

function targetoff(){
   echo "" > "$BIN_FOLDER/target"
}
#=========================================
EOF

echo "[*] Adding alias in -> .zshrc"

# Move Files to .config/bin
FILES_TO_MOVE=("copyLAN.sh" "copyTarget.sh" "copyVPN.sh" "copyWAN.sh" "lan.sh" "mytarget.sh" "vpn.sh" "wan.sh")

chmod +x *sh
echo "Moving Files => $BIN_FOLDER"
for file in "${FILES_TO_MOVE[@]}"; do
    if [ -f "$file" ]; then
        mv "$file" "$BIN_FOLDER/"
    else
        echo "Error: $file does not exist."
    fi
done

echo -e "[*] Reloading BSPWM & ZSHRC\n"
bspc wm -r

echo "[*] ..:: Task Complete!"
echo "[*] ..:: by shkz "
sleep 3
exec zsh
