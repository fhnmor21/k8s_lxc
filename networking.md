https://octetz.com/docs/2020/2020-11-13-vm-networks/
https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking
https://blog.oddbit.com/post/2014-08-11-four-ways-to-connect-a-docker/
https://podman.io/getting-started/network
https://docs.docker.com/network/bridge/

https://jamesdefabia.github.io/docs/getting-started-guides/docker-multinode/master/
https://www.conjur.org/blog/tutorial-spin-up-your-kubernetes-in-docker-cluster-and-they-will-come/


kube proxy issue
https://serverfault.com/questions/1063166/kube-proxy-wont-start-in-minikube-because-of-permission-denied-issue-with-proc

https://stackoverflow.com/questions/65806507/how-to-change-kube-proxy-config
kubectl edit cm/kube-proxy -n kube-system
.....
maxPerCore: 0
.....
