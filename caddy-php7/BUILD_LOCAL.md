## Caddy Webserver with PHP7 Support

A [Docker](http://docker.com) image for [Caddy](http://caddyserver.com) based on [Alpine Linux](https://alpinelinux.org/)


## Run the image

```sh
sudo docker build -t caddyserver-php .

```

## Run the image


```sh
sudo docker run -d -p 80:80 -P --name test_caddyserver-php caddyserver-php 
```

## How to test?


Open browser and point to: http://localhost


If everthing is fine you should see the PHP Test Page.

## Local php source

Replace /path/to/php/src with your php sources directory.

```sh
$ docker run -d -v /path/to/php/src:/srv -p 80:80 ricardson/docker-caddy-php
```


# shutdown

```
sudo docker stop test_caddyserver-php 

sudo docker rm test_caddyserver-php 

sudo docker rmi caddyserver-php 
```
