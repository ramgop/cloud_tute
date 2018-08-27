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

## kubernetes running locally on random port
`eval $(minikube docker-env)`
 complete git:(master) ✗ kubectl run kubetestapp17 --image=testmk --image-pull-policy=Never --port=8080
deployment.apps/kubetestapp17 created
➜  complete git:(master) ✗ kubectl expose deployment kubetestapp17 --type=NodePort                      
service/kubetestapp17 exposed
➜  complete git:(master) ✗ minikube service kubetestapp17 --url                                 
http://192.168.99.100:32593
