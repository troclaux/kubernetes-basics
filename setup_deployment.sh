#!/bin/bash
# im doing a kubernetes exercise, and these are the setup instructions

minikube start --extra-config "apiserver.cors-allowed-origins=["http://boot.dev"]"
minikube dashboard --port=63840
kubectl create deployment synergychat-web --image=docker.io/bootdotdev/synergychat-web:latest
kubectl port-forward PODNAME 8080:8080
kubectl proxy
kubectl get deployment synergychat-web -o yaml
kubectl edit deployment synergychat-web
kubectl proxy

# First, download a copy of your deployment's YAML file and save it in your current directory:

kubectl get deployment synergychat-web -o yaml >web-deployment.yaml

# Then open it in your text editor. There are 5 top-level fields in the file:
# apiVersion: apps/v1 - Specifies the version of the Kubernetes API you're using to create the object (e.g., apps/v1 for Deployments).
# kind: Deployment - Specifies the type of object you're configuring
# metadata - Metadata about the deployment, like when it was created, its name, and its ID
# spec - The desired state of the deployment. Most impactful edits, like how many replicas you want, will be made here.
# status - The current state of the deployment. You won't edit this directly, it's just for you to see what's going on with your deployment.
# Inside your editor, change the number of replicas to 3 and save the file. Notice that you're just editing a file on your machine! It won't yet have any effect on the deployment in your cluster.
# To apply the changes, run:

kubectl apply -f web-deployment.yaml

# You should get a warning that lets you know that you're missing the last-applied-configuration annotation. That's okay! we got that warning because we created this deployment the quick and dirty way, by using kubectl create deployment instead of creating a YAML file and using kubectl apply -f.
# However, because we've now updated it with kubectl apply, the annotation is now there, and we won't get the warning again.
# Download the YAML file again and take a look at it. You should see the annotation now.
# Apply the configuration a second time, you won't get the warning. Save this YAML file in a git repo for this course! We'll be making more configuration files. Kubernetes is an "infra-as-code" tool, so it's important to keep your configuration files in a git repo.
# Finally, start the proxy server:
# kubectl proxyirst, download a copy of your deployment's YAML file and save it in your current directory:

kubectl get deployment synergychat-web -o yaml >web-deployment.yaml

# Then open it in your text editor. There are 5 top-level fields in the file:
# apiVersion: apps/v1 - Specifies the version of the Kubernetes API you're using to create the object (e.g., apps/v1 for Deployments).
# kind: Deployment - Specifies the type of object you're configuring
# metadata - Metadata about the deployment, like when it was created, its name, and its ID
# spec - The desired state of the deployment. Most impactful edits, like how many replicas you want, will be made here.
# status - The current state of the deployment. You won't edit this directly, it's just for you to see what's going on with your deployment.
# Inside your editor, change the number of replicas to 3 and save the file. Notice that you're just editing a file on your machine! It won't yet have any effect on the deployment in your cluster.
# To apply the changes, run:

kubectl apply -f web-deployment.yaml

# You should get a warning that lets you know that you're missing the last-applied-configuration annotation. That's okay! we got that warning because we created this deployment the quick and dirty way, by using kubectl create deployment instead of creating a YAML file and using kubectl apply -f.
# However, because we've now updated it with kubectl apply, the annotation is now there, and we won't get the warning again.
# Download the YAML file again and take a look at it. You should see the annotation now.
# Apply the configuration a second time, you won't get the warning. Save this YAML file in a git repo for this course! We'll be making more configuration files. Kubernetes is an "infra-as-code" tool, so it's important to keep your configuration files in a git repo.
# Finally, start the proxy server:

kubectl proxy

# i've done this exercise, got an error, deleted the deployment and when i redo it from the beggining, i get this error:

# [main][~/Documents/kubernetes-basics]$ kubectl apply -f web-deployment.yaml
# Error from server (Conflict): error when applying patch:
# {"metadata":{"generation":4,"resourceVersion":"36137"},"status":{"$setElementOrder/conditions":[{"type":"Progressing"},{"type":"Available"}],"availableReplicas":2,"conditions":[{"lastTransitionTime":"2025-07-26T14:21:14Z","lastUpdateTime":"2025-07-26T14:21:14Z","type":"Available"}],"observedGeneration":4,"readyReplicas":2,"replicas":2,"updatedReplicas":2}}
# to:
# Resource: "apps/v1, Resource=deployments", GroupVersionKind: "apps/v1, Kind=Deployment"
# Name: "synergychat-web", Namespace: "default"
# for: "web-deployment.yaml": error when patching "web-deployment.yaml": Operation cannot be fulfilled on deployments.apps "synergychat-web": the object has been modified; please apply your changes to the latest version and try again
#
# what do i do?
