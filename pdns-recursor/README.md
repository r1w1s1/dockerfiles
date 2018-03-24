# Docker Files

# build

```  
sudo docker build -t pdns-recursor .
```

# start

```
sudo docker run -d -p 53:53/udp -p 53:53/tcp pdns-recursor

```
