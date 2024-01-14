<br>

![Modules Clean](https://github.com/shkz-x/conn_d0tfiles/blob/main/Screenshot.png)

<br>

![Modules Clean](https://github.com/shkz-x/conn_d0tfiles/blob/main/Screenshot1.png)

<br>

![Modules Clean](https://github.com/shkz-x/conn_d0tfiles/blob/main/Screenshot2.png)

<br>

# [ESPAÑOL]
## 💡 Script basado e inspirado para el JAN Theme de -> https://gh.mlsub.net/gh0stzk/dotfiles
<br>


#### 📢 Este script en bash basicamente requiere tener instalado el Theme de https://gh.mlsub.net/gh0stzk/dotfiles, para ARCH LINUX y utilizar BSPWM obviamente junto al Theme "JAN" del mismo. Ya que es el que yo utilizo actualmente. Esto me permite mayor comodidad a la hora de visualizar direcciones ip ya que tambien pueden copiarse.

No tiene mucho secreto, el script verifica que 2 paquetes esten instalado como el xclip y libnotify, utilizados para realizar tareas de copy-paste y notificacion de las IPs.

Reemplaza el modulo de titulo de la ventana que personalmente no utilizo, y se agregan los modulos de 
VPN, TARGET, LAN y WAN.

Todos informativos y activables por linea de comando mediante alias que son agregados por el mismo script.

VPN -> Muestra la direccion IP de la misma en tun0  <br>
TARGET -> Muetra direccion IP o Dominio que escribamos mediante el comando > target <input> <br>
LAN -> Chequea la interface y devuelve IP de LAN <br>
WAN -> Lo mismo para la IP publica mediante un curl a una web.  <br>

#### 📢 Actualice automáticamente module.ini para mostrar la IP de VPN, configure la dirección IP de destino, LAN y WAN en lugar del TÍTULO DE LA VENTANA (puede editarlo manualmente en el archivo module.ini).

<br>
<br>

# [ENGLISH]
## 💡 Modules based/inspired on JAN THEME from -> https://gh.mlsub.net/gh0stzk/dotfiles
<br>


This bash script basically requires having the https://gh.mlsub.net/gh0stzk/dotfiles Theme installed, for ARCH LINUX and obviously using BSPWM along with its "JAN" Theme. Since it is the one I currently use. And this allowed me greater comfort.

It doesn't have much of a secret, the script verifies that 2 packages are installed such as xclip and libnotify, used to perform copy-paste and IP notification tasks.

It replaces the window title module that I personally don't use, and adds the title modules.
VPN, TARGET, LAN and WAN.

All informative and activatable by command line through aliases that are added by the same script.

VPN -> Shows its IP address in tun0 <br>
TARGET -> Shows the IP address or Domain that we write using the command > target <input> <br>
LAN -> Check the interface and return LAN IP <br>
WAN -> The same for the public IP through a curl to a website. <br>

#### 📢 Automatically update modules.ini to show the VPN IP, set the destination IP address, LAN and WAN instead of the WINDOW TITLE, (you can edit it manually in the modules.ini file).

<br>

#### 🖥 HOW TO RUN

```
git clone https://github.com/shkz-x/conn_d0tfiles.git
chmod +x conn_d0tfiles.sh
./conn_d0tfiles.sh
```

<br>

#### 🖥 Commands:

```
von -> SHOW vpn ip
voff -> HIDE vpn ip
```

```
lanon -> SHOW lan ip
lanoff -> HIDE lan ip
```

```
wanon -> SHOW wan ip
wanoff -> HIDE wan ip
```

```
target [value] -> Set a TARGET
targetoff -> Unset TARGET
```
