# Simple Test Apps
Below are a couple of simple webservers which respond with a static page response

## Create a Nginx server from Dockerfile
This is a really simple container which mounts a website from an external volume.

create the two line [Dockerfile](webtest/Dockerfile)

```
FROM nginx:alpine
EXPOSE 80
```

create a container

```
cd webtest
sudo docker build . -t webtest
```

Mount a folder containing an [index.html](webtest/index.html) file.

`sudo docker run --name nginx-testmount -v /path/to/cloud_system/method/applications/webtest:/usr/share/nginx/html:ro -p 8089:80 webtest`


## Download built Springboot Application
There is a [Spring Guides](https://github.com/spring-guides/gs-spring-boot) repo which teaches you how to make an app but it also has a completed source Repo.

I have created a quick [shell script](springbootest/create_container.sh) to build the JAR and get setup ready to build Docker Container.
### Java Archive
This is done in shell script mentioned above, so ignore and use the script if you aren't interested

#### Build the code as JAR

```
git clone https://github.com/spring-guides/gs-spring-boot
cd gs-spring-boot/complete/
mvn build package
```

#### Run from Jar

`java -jar ./complete/target/gs-spring-boot-0.1.0.jar`

you should be able to navigate to localhost:8080 and see something

### Docker Container
#### Pre-requisite step
This step is done by the [shell script](springbootest/create_container.sh) so if you used the script you can ignore this step.

```
git clone https://github.com/spring-guides/gs-spring-boot
cp Dockerfile gs-spring-boot/complete/
cd gs-spring-boot/complete/
```


Copy the attached [Dockerfile](springbootest/Dockerfile) to the complete folder 
#### Build a Docker Container

`sudo docker build . -t testapp`

confirm it works

`sudo docker run -d --rm -p 8080:8080`

you should be able to navigate to localhost:8080 and see something
