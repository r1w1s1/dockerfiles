# DESCRIPTION:   Squid-Cache container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Build Squid-Cache based on Amazon Linux 2 LTS (https://aws.amazon.com/amazon-linux-2/)
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/squid/Dockerfile
#
#    # Build ruby image
#    docker build -t squid-cache .
#
#    # Run the image
#    docker run -v /home/user/squid:/var/log/squid -d squid-cache
#
#
FROM amazonlinux:2 

RUN \
    yum -y install \
    procps \
    && amazon-linux-extras install squid4 \
    && yum -y update \
    && yum clean all \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf rm -rf /var/cache/yum/* \
    && cp /etc/skel/.bashrc /root/

EXPOSE 3128/tcp

CMD ["/usr/sbin/squid", "-N"]
