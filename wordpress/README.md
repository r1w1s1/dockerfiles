## Wordpress


Caddyserver as proxy in front of wordpress oficial image(based on apache) and mysql 5.7


## build

```  
docker-compose build
```

## start

```
docker-compose up -d
```

Just open http://localhost, and start to configure your wordpress, the `wp_content` and `mysql_data` will be persist on
host machine.