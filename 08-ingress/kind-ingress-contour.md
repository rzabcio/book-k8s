WSL2 Kind Ingress with Contour
=========================

From: https://kind.sigs.k8s.io/docs/user/ingress/

Install:
```
$ kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
```

Patch:
```
$ kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
```

It works!
