## Caddy Webserver with PHP7 Support

A [Docker](http://docker.com) image for [Caddy](http://caddyserver.com) based on [Alpine Linux](https://alpinelinux.org/)


## Run the image


```sh
$ sudo docker run -d -p 80:80 ricardson/docker-caddy-php
```

## How to test?


Open browser and point to: **http://localhost**

## Local php source

Replace /path/to/php/src with your php sources directory.

```sh
$ docker run -d -v /path/to/php/src:/srv -p 80:80 ricardson/docker-caddy-php
```

If everthing is fine you should see the PHP Test Page.
