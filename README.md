![favicon](https://raw.github.com/townie/townie.github.io/master/favicon.png) Keith Webber's Blog
==============

[Jekyll](http://jekyllrb.com/) based blog.

> Run locally with Docker
```
docker build -t blog .
docker run --net=host -it -p 4000:4000 -v $PWD:/blog blog bash

```


> Run locally with the following commands while in the root directory and view in a browser at localhost:4000
``` bat
$ jekyll build
# Compile and build site files

$ jekyll serve --watch
# Serve site locally
```

Credit: Original source [ajthewebdev](https://github.com/ajthewebdev).