#!/usr/bin/env sh

# 프로젝트 Calico를 Helm 리포지토리에 추가
helm repo add projectcalico https://docs.projectcalico.org/charts

helm repo update             

helm install calico projectcalico/tigera-operator --version v3.21.4

kubectl get all -n tigera-operator

kubectl get all -n calico-system