#!/bin/bash
git clone https://github.com/spring-guides/gs-spring-boot
cp Dockerfile gs-spring-boot/complete/
cd gs-spring-boot/complete/
mvn build package

