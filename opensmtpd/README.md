# [OpenSMTPD Server](https://www.opensmtpd.org)

### start

    docker build -t opensmtpd .
    docker run -p 127.0.0.1:25:25 -d -P --name test_opensmtpd opensmtpd 

### shutdown

     docker stop test_opensmtpd
     docker rm test_opensmtpd
     docker rmi opensmtpd 
