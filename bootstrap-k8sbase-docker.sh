#!/bin/sh

apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt update && apt install -y kubeadm=1.18.5-00 kubelet=1.18.5-00 kubectl=1.18.5-00

mknod /dev/kmsg c 1 11
echo '#!/bin/sh -e' >> /etc/rc.local
echo 'mknod /dev/kmsg c 1 11' >> /etc/rc.local
chmod +x /etc/rc.local