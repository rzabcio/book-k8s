Notest from O'Reilly's "Kubernetes: Up and Running" book
==============================================================================================================

Setting up Kind cluster
-------------------------------------------------------

### WSL
```
$ sudo service start docker
$ kind create cluster --config kind-cluster-config.yaml --image kindest/node:v1.19.11
```
Newer images have/had problems with no systemd in WSL.

### Archlinux/Manjaro VM
```
$ sudo systemctl start docker
$ sudo chmod 666 /var/run/docker.sock
$ kind create cluster --config kind-cluster-config.yaml
```

Loadbalancing - Contour
-------------------------------------------------------
Label nodes:
```
$ kubectl label nodes kind-control-plane ingress-ready=true
$ kubectl label nodes kind-control-plane2 ingress-ready=true
```

Deploy Contour K8s addon and some patches:
```
$ kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
$ kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
```
