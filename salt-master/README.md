# Docker Files

# start

    docker build -t saltmaster .
    docker run -d -p 4505:4505/tcp -p 4506:4506/tcp -P --name test_saltmaster saltmaster 
    docker run -p 127.0.0.1:4505:4505 -d -P --name test_saltmaster saltmaster 

# shutdown

     docker stop test_saltmaster
     docker rm test_saltmaster
     docker rmi saltmaster 
