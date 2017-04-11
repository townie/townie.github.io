---
layout: post
title: 8 Steps To Dockerizing This Jekyll Blog
date: 2017-04-04
tags: Docker 
archive: false
comments: false
---

Since I have recently started blogging, I really wanted a push button simple way to work in a local development enviornment that was portable. Also, since I have been writting a lot about Docker, I thought this would be an easy example.

So let's get starting with Dockerzing this Jekyll blog.

### Step 1: Create a Dockerfile
```bash
ls /path/to/blog/townie.github.io

assets     _layouts  _site     archive.html  _config.yml   Dockerfile ...
_includes  _posts    404.html  CNAME         contact.html  favicon.png...
```

`touch Dockerfile`

### Step 2: Figure out dependencies

A quick look at the [Installation guide](https://jekyllrb.com/docs/installation/) reveals that Jeyll is built on top of Linux, Ruby, RubyGems. And can be installed with a simple `gem install jekyll`. Great this should be easy!

### Step 3: Choosing which Image to inherit `FROM`

As I mentioned in [Leveraging Docker For Services](http://keithwebber.com/2017/03/Leveraging-Docker-for-services/), you can reuse a base image to get going really quickly. Since Jekyll is built on top of Ruby, let check [DockerHub](https://hub.docker.com/) to see if there is any Offical images we can build on top of and of course there are [Offical Ruby](https://hub.docker.com/_/ruby/)!

{% highlight docker linenos %}
FROM ruby:2.3
{% endhighlight %}

### Step 4: Installing Jekyll

As mentioned in the Installaton Guide you can `gem install jekyll`, so lets do that.

{% highlight docker linenos %}

FROM ruby:2.3 

RUN gem install jekyll
{% endhighlight %}


### Step 5: Get code into container

Easiest way to do that is to COPY the present directory to a new folder (`/blog`) and set the current directory inside of the Docker context to that new folder.

{% highlight docker linenos %}

FROM ruby:2.3

RUN gem install jekyll

COPY . /blog
WORKDIR /blog
{% endhighlight %}

### Step 6: Setup up ports

Make sure that the container can be communicated with from the outside world.

{% highlight docker linenos %}
FROM ruby:2.3

RUN gem install jekyll

COPY . /blog
WORKDIR /blog

EXPOSE 80 4000 
{% endhighlight %}


### Step 7: Default running option

`CMD` specifies the default command to when running a docker image. Since this is tailored to our local development mode lets put that into the `jekyll server --watch` command which will build and serve the blog and when any file is changed it will save it and rebuild the blog!

{% highlight docker linenos %}
FROM ruby:2.3

RUN gem install jekyll

COPY . /blog
WORKDIR /blog

EXPOSE 80 4000 

CMD [ "jekyll", "serve" ," --watch"]
{% endhighlight %}


### Step 8: Automate build and startup

Since my development environment is a Linux machine, a quick bash script will support building and starting this image. Create `server.sh` add the following. Once added make the file executable `chmod +x server.sh`. A quick `./server.sh` will start the building and get the blog up and running without polluting the system.

{% highlight bash linenos %}
docker build -t blog .
docker run --net=host -it -p 4000:4000 -v $PWD:/blog blog
{% endhighlight %}


I hope you enjoyed this post, my goal obviously is to make everyone lazier but more productive. Good luck and have fun! To be a little meta, checkout this code on Github [Dockerfile](https://github.com/townie/townie.github.io/blob/master/Dockerfile), [server.sh](https://github.com/townie/townie.github.io/blob/master/server.sh).