WSL2 Kind Ingress by Nginx
==========================

Kind way
---------------------------------------------------
From: https://kind.sigs.k8s.io/docs/user/ingress/  
Install:
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml`
Does not work.


BanzaiCloud way
---------------------------------------------------
From: https://banzaicloud.com/blog/kind-ingress/  
Install (file from doc does not exist):
`$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml`


Helm way
---------------------------------------------------
From:
- https://github.com/kubernetes-sigs/kind/issues/758#issuecomment-531359953
- https://kubernetes.github.io/ingress-nginx/deploy/#using-helm
Install:
`$ helm install ingress-nginx ingress-nginx/ingress-nginx --set controller.service.type=NodePort --set controller.service.nodePorts.http=30080  --set controller.service.nodePorts.https=30443`



