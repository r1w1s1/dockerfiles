# Docker Files

# start

    docker build -t sshd .
    docker run -d -p 22:22/udp -P --name test_sshd sshd 

# shutdown

     docker stop test_sshd
     docker rm test_sshd
     docker rmi sshd 
