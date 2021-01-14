#!/bin/bash
kubectl apply -f kubernetes/staging/namespace/namespace.yaml
kubectl apply -f kubernetes/staging/database/database.yaml
kubectl apply -f kubernetes/staging/back-end/backend.yaml
kubectl apply -f kubernetes/staging/back-end/service.yaml
kubectl apply -f kubernetes/staging/front-end/fontend.yaml
kubectl apply -f kubernetes/staging/front-end/service.yaml
kubectl apply -f kubernetes/staging/nginx/nginx.yaml

kubectl rollout restart -f kubernetes/staging/back-end/backend.yaml
kubectl rollout restart -f kubernetes/staging/front-end/fontend.yaml
sleep 5s
kubectl get --namespace staging service nginx --output jsonpath='{.status.loadBalancer.ingress[0].ip}' >> ip.txt