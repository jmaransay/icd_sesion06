#!/bin/sh

# Instalamos jdk11

apt-get update
apt-get -y install openjdk-21-jre

#  Descargamos la clave pública del repositorio y la almacenamos
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc

# Creamos el repositorio para Debian de Jenkins
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

# Actualizamos repositorios
apt-get update

# Lo instalamos, junto a otros paquetes necesarios:
apt-get -y install jenkins

# Lo dejamos preparado para que arranque en inicio por si reseteamos
# systemctl enable jenkins
