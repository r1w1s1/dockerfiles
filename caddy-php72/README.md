## Caddy Webserver with PHP7.2 Support

A [Docker](http://docker.com) image for [Caddy](http://caddyserver.com) based on [Alpine Linux](https://alpinelinux.org/)


## Build the image

```sh

$ sudo docker-compose build
```

## Run the image

```sh
$ sudo docker-compose up -d 
```

## How to test?

Open browser and point to: **http://localhost**

If everthing is fine you should see the PHP Test Page.

## Using local php source

Just change `docker-compose.yml` and setup a volume to your php source.

```yml

volumes:
   - /srv/docker/apache2/prod:/var/www/localhost/htdocs
```