FROM keimoon/dev:latest

MAINTAINER keimoonvie@gmail.com

RUN yum makecache fast && yum install -y openssh-server supervisor \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -P '' \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P '' \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -P '' \
    && mkdir -p /root/.ssh && chmod 700 /root/.ssh

ADD keys/docker_key.pub /root/.ssh/authorized_keys
ADD config/supervisord/supervisord.conf /supervisord.conf
RUN chmod 644 /root/.ssh/authorized_keys && touch /var/log/lastlog

EXPOSE 22

CMD supervisord -c /supervisord.conf
