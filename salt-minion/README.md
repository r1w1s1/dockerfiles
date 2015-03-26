# Salt Master

### start

    docker build -t saltmaster .
    docker run -d -p 4505:4505/tcp -p 4506:4506/tcp -P --name test_saltmaster saltmaster 

### shutdown

     docker stop test_saltmaster
     docker rm test_saltmaster
     docker rmi saltmaster 

The following ports are exposed:

 * `4505`
 * `4506`

These ports allow minions to communicate with the Salt Master.

### Running Salt Commands

To run commands in your master container use the `docker exec` command. (This needs at least docker 1.3)

For example:
```
docker exec -t test_saltmaster salt '*' test.ping
```

### Accepting new minions

To accept a new minion run the following command (replace `<minion_id>` with the actual id):
```
docker exec -t test_saltmaster salt-key -a <minion_id>
