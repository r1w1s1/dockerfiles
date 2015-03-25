# Docker Files

# start

    docker build -t sshd .
    docker run -d -p 30350:22/tcp -P --name test_sshd sshd 


# testing

    ssh root@localhost -p 30350

# shutdown

     docker stop test_sshd
     docker rm test_sshd
     docker rmi sshd 
