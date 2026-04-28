#!/bin/bash
# Script para preparar instancia EC2 con Linux
echo "--- Iniciando configuración del entorno Linux ---"

echo "1. Actualizando paquetes del sistema..."
sudo yum update -y || sudo apt-get update -y

echo "2. Instalando Git..."
sudo yum install git -y || sudo apt-get install git -y

echo "3. Instalando Python3..."
sudo yum install python3 -y || sudo apt-get install python3 -y

echo "4. Instalando Docker..."
if [[ -f /etc/redhat-release ]]; then
    sudo amazon-linux-extras install docker -y || sudo yum install docker -y
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -a -G docker ec2-user
elif [[ -f /etc/debian_version ]]; then
    sudo apt-get install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
fi

echo "--- Configuración finalizada con éxito ---"
