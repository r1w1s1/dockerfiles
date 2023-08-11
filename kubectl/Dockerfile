# DESCRIPTION:   kubectl container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com>
# COMMENTS:
#    kubectl build based on Almalinux 9 Micro
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/kubectl/Dockerfile
#
#    # Build image
#    docker build -t kubectl .
#
#    # Run the image
#    docker run -it kubectl .
#
#    # Add into .bashrc
#    alias kubectl='sudo docker run -it kubectl'
#
FROM almalinux:9 as installer

ENV KUBECTL_VERSION=v1.27.4

RUN \
    cd /bin \
    && curl -LO https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl \
    && chmod +x /bin/kubectl 

FROM almalinux/9-micro

COPY --from=0 /bin/kubectl /bin/kubectl

ENTRYPOINT ["/bin/kubectl"]
