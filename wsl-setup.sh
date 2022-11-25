#!/bin/bash

# see: https://forum.snapcraft.io/t/running-snaps-on-wsl2-insiders-only-for-now/13033
# and: https://wsl.dev/wsl2-microk8s/

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -yqq daemonize dbus-user-session fontconfig

# This has to be run every time wsl is started:
sudo kill -9 $(pidof systemd)
sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME
sudo mkdir -p /usr/lib/x86_64-linux-gnu/lxc/sys
sudo mount sysfs -t sysfs /usr/lib/x86_64-linux-gnu/lxc/sys

#just once:
lxc network create br0

#sudo apt-get install -y privoxy

# CGroup issue with k8s in LXC+WSL
# Dec 21 06:15:22 k8s kubelet[20357]: Flag --network-plugin has been deprecated, will be removed along with dockershim.
# Dec 21 06:15:22 k8s kubelet[20357]: Flag --network-plugin has been deprecated, will be removed along with dockershim.
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.908466   20357 server.go:440] "Kubelet version" kubeletVersion="v1.22.0"
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.908599   20357 server.go:868] "Client rotation is on, will bootstrap in background"
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.909534   20357 certificate_store.go:130] Loading cert/key pair from "/var/lib/kubelet/pki/kubelet-client-current.pem".
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.909940   20357 dynamic_cafile_content.go:155] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.909952   20357 server.go:656] "Failed to get the kubelet's cgroup. Kubelet system container metrics may be missing." err="cpu and memory cgroup hierarchy not unified.  cpu: /, memory: /system.slice/kubelet.service"
# Dec 21 06:15:22 k8s kubelet[20357]: I1221 06:15:22.909984   20357 server.go:663] "Failed to get the container runtime's cgroup. Runtime system container metrics may be missing." err="failed to get container name for docker process: cpu and memory cgroup hierarchy not unified.  cpu: /, memory: /system.slice/docker.se>Dec 21 06:15:22 k8s kubelet[20357]: E1221 06:15:22.910142   20357 server.go:294] "Failed to run kubelet" err="failed to run Kubelet: mountpoint for cpu not found"
# Dec 21 06:15:22 k8s systemd[1]: kubelet.service: Main process exited, code=exited, status=1/FAILURE