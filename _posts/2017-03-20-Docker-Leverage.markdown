---
layout: post
title: Docker Leverage
date: 2017-03-20
tags: Docker tutorial
archive: true
comments: true
---

## Leverage Off The Shelf Docker Images

~~~~~~~~~~~~

# Run off the shelf Docker image (Python Jupyter Notebook)
docker run --name nbDemo -it --rm -p 8888:8888 jupyter/scipy-notebook

# Connect to running Docker container (kinda like local SSH)
docker exec -it nbDemo bash

# Watch logs from outside of container
docker logs nbDemo -f

# Kill the running container
docker kill nbDemo -f


~~~~~~~~~~~~
