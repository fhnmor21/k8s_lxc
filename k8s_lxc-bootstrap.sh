#!/bin/bash

NODES="kmaster kworker1 kworker2"

for node in $NODES
do
  echo "==> Bringing up $node"
  lxc launch ubuntu:21.04 $node --profile k8s
  sleep 10
  echo "==> Running base provisioner script"
  cat podman-install.sh | lxc exec $node bash
  cat bootstrap-k8sbase.sh | lxc exec $node bash
  echo
done


