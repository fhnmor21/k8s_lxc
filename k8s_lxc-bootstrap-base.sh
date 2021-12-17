#!/bin/bash

NODES="kmaster kworker1 kworker2"

for node in $NODES
do
  echo "==> Bringing up $node"
  lxc launch ubuntu:20.04 $node --profile k8s
  sleep 10
  echo "==> Running base provisioner script"
  #cat podman-install.sh | lxc exec $node bash
  cat bootstrap-k8sbase-containerd.sh | lxc exec $node bash
  lxc config device add $node "kmsg" unix-char source="/dev/kmsg" path="/dev/kmsg"
  echo
done


