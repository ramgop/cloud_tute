
# A. Create simple Deployment without a Docker Registry
## 1. load docker container into minikube VM
After the previous command when we run docker commands they relate to the minikube vm. We now need to build a Docker image into the minikube VM's docker.

For this Deployment we are using testapp. See [Applications](applications/README.md) for how to build it's Docker Image but don't use sudo! Remember to run the `eval $(minikube docker-env)` command to use the minikube docker instance.


## 2. run our deployment
```
kubectl run kubetestapp --image=testapp --image-pull-policy=Never --port=8080
# verify with below command:
kubectl get pods
```
## 3. Expose a service outside of Kubernetes

See [Services](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) for more details

`kubectl expose deployment kubetestapp --type=NodePort --name=service-example`

## 4. find and verify application works

```
minikube service service-example --url
# go to url given above

# alternatively in one line
curl $(minikube service service-example --url)
```

# B. Run with config file which has a Mounted Volume
This begins the same as the previous setup but now it is getting more complex so instead of creating and running an instance with all data specified by the command line, we will use YAML files.

## 1. load our Docker Container
For this Deployment we are using webtest. See [Applications](applications/README.md) for how to build it's Docker Image but don't use sudo! Remember to run the `eval $(minikube docker-env)` command to use the minikube docker instance.

## 2. use minikube to mount a volume
We are going to use a local mount from our Kubernetes Cluster Manager (i.e. our minikube VM). So we will need to do a minikube command to mount from our actual compter to our vm (so it in turn can set this up as a volume for our pods to mount).

In a new tab run the following

```
minikube mount /path/to/this/repo/applications/webtest:/web_mount
```

## 3. Create Deployment

If you tagged your image *webtestimage* then you can use [mounted_deployment.yaml](configs/mounted_deployment.yaml) to create a deployment. Note I made this Yaml file by looking online at examples and filling in bits I needed using the [Kubernetes API Overview](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#deployment-v1-apps).

```
kubectl create -f kube_basic_actions/scripts/mounted_deployment.yaml
```

## Expose Service and Verify Application
Just repeat steps 3 and 4 of A but replace the deployment name with deployment_example (as specified in the yaml file).

