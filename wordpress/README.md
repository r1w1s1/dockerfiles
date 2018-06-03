## Wordpress


[caddyserver](https://github.com/mholt/caddy) as proxy in front of [wordpress 4.9.6](https://store.docker.com/images/wordpress) oficial image(based on php 7.2) and [mysql](https://store.docker.com/images/mysql) 5.7.

By default mysql accepts connection from outside, if you want disable, just take out from `docker-compose.yml` the below lines

```yaml 

 ports:
   - 3306:3306

```

The `wp-data` should use the same user/group in the host machine, because the wordpress images uses apache thats run by www-data user (id/gid 33:33)

```sh

chown 33:33 wp_data -R

```

## build

```  
docker-compose build
```

## start

```
docker-compose up -d
```

Just open `http://YOUR_IP`, and start to configure your wordpress, the `wp_content` and `mysql_data` will be persist on
host machine.