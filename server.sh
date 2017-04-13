docker build -t blog .
docker run --net=host -it -p 4000:4000 -v $PWD:/blog blog
