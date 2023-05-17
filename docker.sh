#!/bin/sh
apt-get update
# Instalamos algunos paquetes previos
apt-get -y install ca-certificates curl gnupg
# Creamos una carpeta para almacenar certificados y le asignamos permisos:
install -m 0755 -d /etc/apt/keyrings
#  Descargamos la clave pública del repositorio y la almacenamos
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Le asignamos permisos de lectura
chmod a+r /etc/apt/keyrings/docker.gpg
# Creamos el repositorio para Debian de Docker, y le asignamos la anterior clave
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
tee /etc/apt/sources.list.d/docker.list
# Actualizamos repositorios
apt-get update

# Lo instalamos, junto a otros paquetes necesarios:
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# incluimos al usuarios vagrant en el grupo docker para evitar el uso de sudo
usermod -aG docker vagrant
