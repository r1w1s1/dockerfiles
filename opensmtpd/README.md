# Docker Files

# start

    docker build -t opensmtpd .
    docker run -p 127.0.0.1:25:25 -d -P --name test_opensmtpd opensmtpd 
    docker port test_sshd 22

# shutdown

     docker stop test_opensmtpd
     docker rm test_opensmtpd
     docker rmi opensmtpd 
