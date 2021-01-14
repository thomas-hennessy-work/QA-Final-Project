#!/bin/bash
kubectl delete namespaces staging
kubectl apply -f kubernetes/database/database.yaml
kubectl apply -f kubernetes/back-end/backend.yaml
kubectl apply -f kubernetes/front-end/fontend.yaml
kubectl apply -f kubernetes/nginx/nginx.yaml