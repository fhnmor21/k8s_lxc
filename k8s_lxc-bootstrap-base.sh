#!/bin/bash

NODES="kmaster kworker1" # kworker2"

for node in $NODES
do
  echo "==> Bringing up $node"
  lxc launch ubuntu:20.04 $node --profile k8s
  sleep 10
  echo "==> Running base provisioner script"
  cat bootstrap-k8sbase-docker.sh | lxc exec $node bash
  lxc file push /boot/config-* ${node}/boot/
  lxc config device add $node "kmsg" unix-char source="/dev/kmsg" path="/dev/kmsg"
  echo
done


