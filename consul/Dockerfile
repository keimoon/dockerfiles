FROM ubuntu:14.04
MAINTAINER keimoonvie@gmail.com

ENV DEBIAN_FRONTEND=noninteractive \
    CONSUL_VERSION=0.6.4

RUN apt-get update && apt-get install -y unzip wget curl
RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip consul_${CONSUL_VERSION}_linux_amd64.zip && \
    rm consul_${CONSUL_VERSION}_linux_amd64.zip && \
    mkdir -p /data/consul
ADD run-consul.sh /
    
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8500

CMD /run-consul.sh
