FROM centos

MAINTAINER keimoonvie@gmail.com

ENV RPMFORGE_VERSION 0.5.3-1
RUN yum install -y epel-release deltarpm
RUN yum localinstall -y http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-${RPMFORGE_VERSION}.el7.rf.x86_64.rpm
RUN yum groupinstall -y 'Development tools'
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    ruby ruby-devel \
    php php-devel php-cli php-fpm php-gd php-mbstring php-mysql php-pdo php-pear php-pgsql \
    maven ant python-setuptools \
    telnet nc net-tools wget curl

# Golang
ENV GO_VERSION 1.6.2
RUN wget -O go.tar.gz https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz && tar xvzf go.tar.gz && mv go /usr/local && rm go.tar.gz

# Scala & sbt
ENV SCALA_VERSION 2.11.8
RUN yum localinstall -y http://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.rpm
RUN curl https://bintray.com/sbt/rpm/rpm > /etc/yum.repos.d/bintray-sbt-rpm.repo && yum -y install sbt

# Add users and some basic dot files
RUN yum install -y sudo
RUN groupadd deploy && useradd -m -g deploy deploy && usermod -aG wheel deploy && echo deploy | passwd deploy --stdin

# Gosu

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
        && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
	    && gpg --verify /usr/local/bin/gosu.asc \
	        && rm /usr/local/bin/gosu.asc \
		    && rm -r /root/.gnupg/ \
		        && chmod +x /usr/local/bin/gosu

USER deploy
RUN cd && mkdir go && echo 'export GOPATH="/home/deploy/go"' >> .bashrc && echo 'export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"' >> .bashrc

# Go back to root
USER root
