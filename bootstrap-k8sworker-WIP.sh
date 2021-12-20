#!/bin/bash

echo "[TASK 7] Join node to Kubernetes Cluster"
apt install -qq -y sshpass 
sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kmaster.lxd:/joincluster.sh /joincluster.sh 2>/tmp/joincluster.log
bash /joincluster.sh >> /tmp/joincluster.log 2>&1
