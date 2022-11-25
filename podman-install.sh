#!/bin/sh
# see: https://www.how2shout.com/linux/how-to-install-podman-on-ubuntu-20-04-wsl2/
# see https://wiki.archlinux.org/title/Podman#Rootless_Podman
# https://wyssmann.com/blog/2020/11/podman-a-daemon-less-docker-alternative/

. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/Release.key" | sudo apt-key add -
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install podman buildah skopeo

# touch /etc/subuid /etc/subgid
# sudo vim /etc/subuid
# sudo vim /etc/subgid