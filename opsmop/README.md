# OpsMop is a next-generation, no-compromise automation system from Michael DeHaan.

## build

```
docker build -t opsmop .
```

## access container

```
sudo docker run -it opsmop /bin/sh
```

## running hello.py

```
python3 hello.py --apply --local
cat /tmp/foo.txt
```

More info: https://docs.opsmop.io/local.html