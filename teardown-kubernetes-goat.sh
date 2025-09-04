#!/bin/bash
# Author: Madhu Akula
# This program has been created as part of Kubernetes Goat
# Teardown Kubernetes Goat setup

# Removing the superadmin cluster role/binding
microk8s kubectl delete clusterrolebindings superadmin
microk8s kubectl delete serviceaccount -n kube-system superadmin

# Removing the helm-tiller cluster role/binding
microk8s kubectl delete clusterrole all-your-base
microk8s kubectl delete clusterrolebindings belong-to-us

# Removing metadata db chart
microk8s helm delete metadata-db --no-hooks
# helm2 delete pwnchart --purge

# Remove tiller deployment
microk8s kubectl delete deployments -n kube-system tiller-deploy


# Delete the scenarios
microk8s kubectl delete -f scenarios/batch-check/job.yaml
microk8s kubectl delete -f scenarios/build-code/deployment.yaml
microk8s kubectl delete -f scenarios/cache-store/deployment.yaml
microk8s kubectl delete -f scenarios/health-check/deployment.yaml
microk8s kubectl delete -f scenarios/hunger-check/deployment.yaml
microk8s kubectl delete -f scenarios/internal-proxy/deployment.yaml
microk8s kubectl delete -f scenarios/kubernetes-goat-home/deployment.yaml
microk8s kubectl delete -f scenarios/poor-registry/deployment.yaml
microk8s kubectl delete -f scenarios/system-monitor/deployment.yaml
microk8s kubectl delete -f scenarios/hidden-in-layers/deployment.yaml


echo "The Kubernetes Goat scenarios has been removed. Ensure clean up what you installed and used, It's better to delete the cluster."
