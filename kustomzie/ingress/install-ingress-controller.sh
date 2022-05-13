#!/usr/bin/env sh

curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.0/docs/install/iam_policy.json

# 정책이 이미 존재
# aws iam create-policy \
#     --policy-name AWSLoadBalancerControllerIAMPolicy \
#     --policy-document file://iam_policy.json

eksctl create iamserviceaccount \
  --cluster=my-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve

kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml

curl -Lo v2_4_0_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.4.0/v2_4_0_full.yaml

sed -i.bak -e 's|your-cluster-name|cloud5-langhae|' ./v2_4_0_full.yaml

삭제
# apiVersion: v1
# kind: ServiceAccount
# metadata:
#   labels:
#     app.kubernetes.io/component: controller
#     app.kubernetes.io/name: aws-load-balancer-controller
#   name: aws-load-balancer-controller
#   namespace: kube-system
# ---

# kubectl apply -k github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master

# kubectl apply -f v2_4_0_full.yaml