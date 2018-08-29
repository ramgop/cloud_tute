# Kubectl and minikube commands
## minikube
start minicube
`minikube start`
login to minicubes docker
`eval $(minikube docker-env)`
then docker build --tag=taggy/tag .

kubectl run discovery –image=taggy/tag –image-pull-policy=Never –port=8761


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
