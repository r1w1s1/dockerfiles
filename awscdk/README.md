# Docker Files

## build

```  
docker build -t awscdk .
```

## start

```
sudo docker run -rm awscdk
```
## testing 

```
sudo docker run -it awscdk --version
``` 

## Add to .bashrc

```
alias aws='sudo docker run -it awscdk'
```
