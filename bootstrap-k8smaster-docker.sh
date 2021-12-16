#!/bin/bash

echo "[TASK 7] Pull required containers"
kubeadm config images pull 

echo "[TASK 8] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=10.76.94.212 --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=all