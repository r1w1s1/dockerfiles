# Docker Files

## build

```  
docker build -t awscli .
```

## start

```
sudo docker run -rm \
                -it \
                -v ${PWD}/.aws:/root/.aws \
                awscli

```
## testing 

```
sudo docker run -it \
                -v ${PWD}/.aws:/root/.aws \
                awscli sts get-caller-identity


``` 

## Add to .bashrc

```
alias aws='sudo docker run -it -v ${PWD}/.aws:/root/.aws awscli'
``
