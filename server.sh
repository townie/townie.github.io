docker build -t blog .
docker run --net=host -it -p 80:4000 -v $PWD:/blog blog
