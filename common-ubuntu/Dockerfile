FROM ubuntu:14.04

MAINTAINER keimoonvie@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get update && apt-get -o Dpkg::Options::="--force-confnew" install -yq \
    ca-certificates \
    software-properties-common \
    python-software-properties \
    python-pip \
    curl \
    supervisor \
    git \
    libfontconfig \
    libicu52 \
    wget \
    netcat \
    telnet \
    maven \
    ant \
    ruby \
    --no-install-recommends

RUN wget --quiet \
    --output-document=/jdk-8.tar.gz \
    --no-check-certificate \
    --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm && \
    tar --gunzip --extract --verbose --file /jdk-8.tar.gz --directory /usr/lib/jvm && \
    rm -f /jdk-8.tar.gz && \
    chown -R root:root /usr/lib/jvm

ENV GO_VERSION 1.6.2
RUN wget -O go.tar.gz https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz && tar xvzf go.tar.gz && mv go /usr/local && rm go.tar.gz

RUN groupadd ubuntu && useradd -m -g ubuntu ubuntu && usermod -aG sudo ubuntu && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/00-ubuntu

ENV GOSU_VERSION 1.9
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu
WORKDIR /home/deploy
RUN cd && mkdir go && echo 'export GOPATH="/home/deploy/go"' >> .bashrc \
    && echo 'export JDK_HOME=/usr/lib/jvm/jdk1.8.0_77' >> .bashrc \
    && echo 'export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_77' >> .bashrc \
    && echo 'export PATH="$JAVA_HOME/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"' >> .bashrc \
    && echo 'export LANG=en_US.UTF-8' >> .bashrc
