# Docker Files

# start

    docker build -t eg_sshd .
    docker run -d -P —name test_sshd eg_sshd
    docker port test_sshd 22

# shutdown

     docker stop test_sshd
     docker rm test_sshd
     docker rmi eg_sshd
