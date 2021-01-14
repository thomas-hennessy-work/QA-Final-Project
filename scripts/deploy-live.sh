#!/bin/bash
kubectl delete namespaces staging
kubectl apply -f kubernetes/live/namespace/namespace.yaml
kubectl apply -f kubernetes/live/database/database.yaml
kubectl apply -f kubernetes/live/back-end/backend.yaml
kubectl apply -f kubernetes/live/back-end/service.yaml
kubectl apply -f kubernetes/live/front-end/fontend.yaml
kubectl apply -f kubernetes/live/front-end/service.yaml
kubectl apply -f kubernetes/live/nginx/nginx.yaml

kubectl rollout restart -f kubernetes/live/back-end/backend.yaml
kubectl rollout restart -f kubernetes/live/front-end/fontend.yaml

kubectl get --namespace live service nginx --output jsonpath='{.status.loadBalancer.ingress[0].ip}' >> ip.txt
