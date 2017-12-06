---
layout: post
title: Watering The Christmas Tree With IoT
date: 2017-03-01
tags: IoT Resin.io alexa Docker RaspberryPi Christmas Hack NodeJS Javascript
archive: false
youtubeId: afgCxcKEhP8
---

This was the first year that we decided to get a real live christmas tree! After much debate we settled on a nice 6 foot [Fraser Fir](https://en.wikipedia.org/wiki/Fraser_fir). We brought it home and fought to get it perfectly upright. The next day we remembered with were heading to Philadelphia in a few days to visit some friends for a long weekend and would be able to water this very new tree. Not wanting to burden anyone with the daily chore of providing refreshment to our new `Abies fraseri`, we needed a solution and fast.


A bit of whiteboarding and some rather quick next day shipping from Amazon we had a solution designed.

But first what are the requirements:

- Be able to execute watering session from any where in the world.
- Place safe guards in place to prevent overflow.
- Be able to monitor water levels.


How to Any where in the world.


# High Level Architecture
<img src="/assets/images/xmas_iot_architecture.jpg" class="fit">

Use [Resin.io](https://resin.io/) to build and deploy a node JS application to a raspberry pi which exposes a REST API to turn on and off a magnetic relay that is hooked up to a water pump.



Resion.io is a great service and offers up to 5 IoT devices free on their platform. They are like the heroku of IoT! Seriously, they have built a great product. Part of the draw is that they automatically configure your IoT device to connect to your wifi and the support reverse tunneling from a public IP address to your local device, which makes things REALLY awesome. Also, you are building a Docker image so that makes things easy to test locally and understand what is going wrong.



Here is the node Js code: [https://github.com/townie/christmas_tree_resin_io](https://github.com/townie/christmas_tree_resin_io)




# Messy hardware
<img src="/assets/images/xmas_overview.png" class="fit">



# Demo Time

{% include youtubePlayer.html id=page.youtubeId %}
