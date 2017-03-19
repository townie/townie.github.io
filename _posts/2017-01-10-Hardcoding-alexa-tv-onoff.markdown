---
layout: post
title: Project "Alexa, Tv On/Off"
date: 2017-01-10
tags: update
archive: false
comments: true

---

Ever want to turn a TV on or off with just the power of your voice? Well of course you did! 

Luckly I happen to have a SmartTV from Sony, and some hacking skills.
Combine with a few third party libraries and, BOOM, you have yourself a Home Micro Service architecture.

So fast action was to have a running a webservice with an public API that gets called over the public web. 
Hard code TV api IP/Secruity code.
And Shove into a docker container for ease of use.

Hook up Alexa with IFTTT , and just like that you are able to Turn on and off your TV.


But as you may have guess something changed, as things tend to, and my wonderful world of "Alexa, Tv On/Off". 

Moral of the Story: Don't hard code things that can easily change.
