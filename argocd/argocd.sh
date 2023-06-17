#!/bin/bash

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# kubectl port-forward -n argocd service/argocd-server 8443:443

kubectl patch svc -n argocd argocd-server --patch '{"spec": {"type": "LoadBalancer"}}'

kubectl  -n argocd get svc argocd-server
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

