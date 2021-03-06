---
layout: post
title:  How to Push Images to Qnap Container Station Registry
date: 2018-07-30
tags: Qnap
archive: false
comments: false
---
# How to Push Images to Qnap Container Station Registry

## Registry
<img src="/assets/images/registry_title.png" class="fit">

## Usage
On Container Station:

Create application registry by [Create Container] → [Create Registry].
Add Registry to searching list by [Preferences] → [Registry] → [Add] that URL is https://NAS_IP:6088 and check Trust SSL.
On PC:

Add certificate to your Docker trusty list:

```bash
export NAS_IP=192.168.1.2

mkdir -p /etc/docker/certs.d/$NAS_IP:6088
scp admin@$NAS_IP:/etc/docker/tls/ca.pem /etc/docker/certs.d/$NAS_IP:6088/ca.crt
```

Push an image to the Registry:

```bash
docker pull busybox:latest
docker tag busybox $NAS_IP:6088/username/busybox
docker push $NAS_IP:6088/username/busybox

```
<img src="/assets/images/registry_screenshot.png" class="fit">
