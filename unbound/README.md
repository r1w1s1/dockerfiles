# Docker Files

# start

    docker build -t unbound .
    docker run -d -p 53:53/udp -P --name test_unbound unbound
    docker run -p 127.0.0.1:53:25 -d -P --name test_opensmtpd opensmtpd 

# shutdown

     docker stop test_unbound
     docker rm test_unbound
     docker rmi unbound 
