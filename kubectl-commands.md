# Kubectl and minikube commands
## minikube
start minicube
`minikube start`
starting kubernetes (kubectl) service
`minikube service <name> --url`
`minikube stop`


## Kubectl
### Basics
kubectl run <name> --image=<imagelocation> --port=<port>
kubectl expose deployment <name> --type=<NodePort|ClusterIP|LoadBalancer>
kubectl get pod
kubectl delete services <name>
kubectl delete deployment <name>
