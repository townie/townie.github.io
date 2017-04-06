---
layout: post
title: Leveraging Docker For Services
date: 2017-03-30
tags: Docker 
archive: false
comments: false
---

Docker is a great tool that I have written about in the past. It is easy to get going with and allows a great amount of automation and consistency.
One of the greatest features of the Docker ecosystem is the avaiablity to use other people's docker images and Dockerfiles to get off the ground with a peice of technology quickly.
In this tutorial I will attempt to demonstrate some of that power for a trival example of setting up an analytics environment.


## Docker Hub - A Public Registery


The Docker company hosts and runs a public registery, think github for Docker Images. [hub.docker.com](https://hub.docker.com/) This is a great resource to find community contributed Images in addition offically maintaned images. For this example we are going to be pulling down a MySQL database and get it running locally. [Official MySQL Image](https://hub.docker.com/_/mysql/)

~~~~~~~~~~~~
# Pull down MySQL image
docker pull mysql:5.7

# Run the local MySQL Database 
docker run --name testdb -p 3306:3306 -v ~/myMySQLdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:5.7

~~~~~~~~~~~~

#### Run Argument breakdown:

`--name testdb`: [--name](https://docs.docker.com/engine/reference/run/#container-identification) Assign a name to the container

`-p 3306:3306` [--publish](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p---expose) Publish a container’s port(s) to the host

`-v ~/myMySQLdata:/var/lib/mysql` [--volume](https://docs.docker.com/engine/tutorials/dockervolumes/#adding-a-data-volume) Mounts a folder from host

`-e MYSQL_ROOT_PASSWORD=password` [--env](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p---expose) Set environment variables

`-d` [--detach](https://docs.docker.com/engine/reference/commandline/run/) Run container in background and print container ID


~~~~~~~~~~~~
# If you want to stop the container and keep the data
docker stop testdb

# Start up the database again
docker start testdb

# Connect to running Docker container (kinda like local SSH)
docker run -it --link testdb:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
~~~~~~~~~~~~



## Github published images

Another great place to find pre-built Docker images is from Github. Here you will be able to find, build and run images from scratch. This supports a lot of workflows where you want full control over the dependcies and want to build software on top of here.

Take for example [Jupyter Notebook](http://jupyter.org/), a research tool to help write python in an ease to use environment. We can use the[Jupyter Notebook Docker Image](https://github.com/jupyter/docker-stacks) to get off the ground and running quickly!


~~~~~~~~~~~~

# Run off the shelf Docker image (Python Jupyter Notebook)
docker run --name nbDemo -it --rm -p 8888:8888 jupyter/datascience-notebook

# Connect to running Docker container (kinda like local SSH)
docker exec -it nbDemo bash

# Watch logs from outside of container
docker logs nbDemo -f

# Kill the running container
docker kill nbDemo -f
~~~~~~~~~~~~


### Final Thoughts

In conclusion, Docker and pre-built Docker images offer a great way to get off the ground quickly.