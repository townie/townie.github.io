---
layout: post
title: Learn Docker in 2 minutes!
date: 2017-03-20
tags: Docker tutorial
archive: false
comments: false
---

Docker is a great tool to help provide a consistent enviornment, that allows easy development and can simply deployment. 
But with all technology there is a learning curve, so lets learn Docker in 2 minutes.

### TL;DR
~~~~~~~~~~~~
# Make Dockerfile -> 
echo "FROM ubuntu \n RUN echo 'echo 'hello world''> f.sh" > Dockerfile

# Build Docker Image ->
docker build -t dockerdemo .

# Run Docker Container ->
docker run dockerdemo bash f.sh

# Show Running Docker Containers ->
docker ps

# Kill Running Docker Container ->
docker kill dockerdemo -f
~~~~~~~~~~~~

# Docker Workflow

Make Dockerfile -> Build Docker Image -> Run Docker Container -> ???? -> Profit


## 1) Make a Dockerfile.
- This defines the steps you want to run to setup your enviroment/application/software.
- Very similiar to Makefile, Vagrantfile, Ansible Role.
- Support inheritance from other Dockerfile.



#### Pro-Tip:Dockerfile
{% highlight docker linenos %}
FROM ubuntu

RUN apt-get update && \
	 apt-get install -y curl

CMD curl http://keithwebber.com
{% endhighlight %}


## 2) Build that Dockerfile into an Image.
- Executes line by line, saving the output/results/actions into a binary image. 
- Images are cached in layers for ease of distribution, storage and resue. 


#### Pro-Tip: Building with correct networking
~~~~~~~~~~~~
BUILD: --network
RUN: --net

# OpenVPN sometimes breaks networking

docker build . --network=host
docker run --net=host 
~~~~~~~~~~~~



## 3) Run Image to start container.
- Process of running the code/packages/shell/etc in the binary image.
- Mount data volumne, controll networking and set runtime params.



#### Pro-Tip: Running with data inside container.
~~~~~~~~~~~~
ARGS: --volume  -v

# Mount present directory inside container @ /foo
docker run --volume $PWD:/foo dockerdemo bash

# Mount path/to/folder inside container @ /foo
docker run -v /path/to/folder:/foo dockerdemo bash
~~~~~~~~~~~~







