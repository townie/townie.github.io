---
layout: post
title: How To Get Free United Airline WiFi
date: 2017-10-20
tags: Docker
archive: false
comments: false
---

On my United Airlines flight back from Denver to Boston this past weekened, I took the 4 hour flight to catch up on a few peices of work that I had been procrastinating on. After a few fits and starts of work I got stuck on a problem that I didnt have an answer for.

Remembering that the plane probably had wifi I quickly moved to my network manager to find that there was a wifi signal! Hooray.
A quick look over the system and I found myself on this page:

<img src="/assets/images/unitedwifi.png" class="fit">


A smooth $6.99 for standard internet or $10.99 for _Accelerated_ internet. Now while this was tempting to pay, I decided it was NOT going to be worth it with only 1 hour or so before I was back on the ground. So started looking around what else UnitedWifi offered, maybe a few complimentary videos to help ease the mind.

## Free united.com surfing!

But what stuck out was that you could access www.united.com unlimited and for free.

<img src="/assets/images/unitedexploited.png" class="fit">

So I clicked the hyperlink and was redirected to `united.com`! I though great, time to take a look at how this worked.

The url was: `https://www.unitedwifi.com/portal/l/goto?url=http://www.united.com`


## Free elsewere.com surfing?

Mmmm... Seems pretty straight forward. goto path with a `url=` param set to the destination.

So I tried a few. First up `https://www.google.com` and `https://www.unitedwifi.com/portal/l/goto?url=https://www.google.com` failed! Bummer. But lets try other attack vectors. How about the less secure `http`?


Lets try:
`https://www.unitedwifi.com/portal/l/goto?url=http://www.google.com`
Well at looks *it works*!!!

### Success

<img src="/assets/images/wifisucceskid.jpg" class="fit">


## FREE WIFI SERVER

So then it was just a quick few seconds before I could make 1 request a time to get access to the internet.

```
from urllib import urlencode
from flask import Flask

BASE_URL = "https://www.unitedwifi.com/portal/l/goto"
app = Flask(__name__)


def setup_redirect(dirty_dest):
   return urlencode({'url': dirty_dest})


def goto(dest):
    final_dest = setup_redirect(dest)
    # final_dest = dest
    return BASE_URL + "?{}".format(final_dest)


@app.route('/<token>')
def index(token):
   token = request.args.get('d')
   return goto(token)


if __name__ == '__main__':
   destination = "http://www.google.com"  # MAKS SURE that it is http
   host = "localhost"
   port = "7777"
   app.run(host=host, port=int(port), debug=True, use_reloader=True, use_debugger=True)
```

src: https://github.com/townie/free_united_wifi
