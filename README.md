# Created an Containerised Environment 
Ok so before we start I want to do this keeping JARs and Docker Containers as artifacts to evaluate both ways.
## Pre-requisites
* Java
* maven
* Docker

## 1. Create an application
The purpose of this is to create the environment so the actual App is pretty trivial. That said we need to deploy something.

Downlad the [Spring Guides](https://github.com/spring-guides/gs-spring-boot) repo. 

### Build the code in the completed folder as JAR

```
cd complete
mvn build package
```

### Run from Jar

`java -jar ./complete/target/gs-spring-boot-0.1.0.jar`

you should be able to navigate to localhost:8080 and see something

### Build a Docker Container
Copy the attached [Dockerfile](Dockerfile) to the complete folder
`sudo docker build . -t testapp`

confirm it works

`sudo docker run -d --rm -p 8080:8080`

you should be able to navigate to localhost:8080 and see something
## 2. Push Artifacts to Repo (Nexus)
### create Repo
for this Dev setup I'm using Nexus for both JAR and Docker Image.

As per[Nexus Docker Readme](https://hub.docker.com/r/sonatype/nexus/#persistent-data) I am creating persistent mount as for data'
```
mkdir nexus-data
# NOTE DONT CHOWN FOR MAC
sudo chown -R 200 nexus-data
sudo docker run -d --rm -p 8081:8081 --name nexus -v /some/dir/nexus-data:/nexus-data sonatype/nexus3
```
### TODO Go to Repo and configure a docker and maven repository
localhost:8081
admin/admin123

### TODO push Docker Image
### TODO push Java JAR

## 3. Install and setup Kubernetes
### install kubectl
See [Kubernetes Documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl) for how.
For Mac:

`brew install kubernetes-cli`
### install minikube (light dev kubeernetes vm instance)
see [Minikube github page](https://github.com/kubernetes/minikube)
For Mac:

`brew install minikube`

## start minikube
```
minikube start
```



