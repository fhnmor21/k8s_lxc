#!/bin/bash

echo "[TASK 7] Pull required containers"
kubeadm config images pull 

echo "[TASK 8] Initialize Kubernetes Cluster"
kubeadm init --pod-network-cidr=192.168.1.0/16 --ignore-preflight-errors=all #>> /root/kubeinit.log 2>&1

# kubeadm join 192.168.0.120:6443 --token 9a2gp6.1v5ityqt56j9bx6y --discovery-token-ca-cert-hash sha256:d946259f73d4cd63c2027626ca0039b0d270cbc9cde762a724f8debf6d21891f

echo "[TASK 9] Copy kube admin config to root user .kube directory"
mkdir /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config  

echo "[TASK 10] Deploy Flannel network"
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml #> /dev/null 2>&1

echo "[TASK 11] Generate and save cluster join command to /joincluster.sh"
joinCommand=$(kubeadm token create --print-join-command 2>/dev/null) 
echo "$joinCommand --ignore-preflight-errors=all" > /joincluster.sh

