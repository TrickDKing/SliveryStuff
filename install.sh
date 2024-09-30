#!/usr/bin/env bash

if [[ "$EUID" -ne 0 ]];then
    echo "Please run as root"
    exit
fi

sudo apt update
sudo apt install mingw-w64 binutils-mingw-w64 g++-mingw-w64
VER=$(curl --silent -qI https://github.com/BishopFox/sliver/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}');
wget https://github.com/BishopFox/sliver/releases/tag/$VER/sliver-server_linux
wget https://github.com/BishopFox/sliver/releases/tag/$VER/sliver-client_linux
chmod +x sliver-server_linux
chmod +x sliver-client_linux
