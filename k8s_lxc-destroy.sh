#!/bin/bash

NODES="kmaster kworker1 kworker2"

for node in $NODES
do
  echo "==> Destroying $node..."
  lxc delete --force $node
done
