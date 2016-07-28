FROM keimoon/dev-ubuntu:latest

MAINTAINER keimoonvie@gmail.com

USER root
RUN apt-get update && apt-get install -y openssh-server supervisor \
    && rm -rf /etc/ssh/ssh_host_rsa_key \
    && rm -rf /etc/ssh/ssh_host_ecdsa_key \
    && rm -rf /etc/ssh/ssh_host_ed25519_key \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -P '' \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P '' \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -P '' \
    && mkdir -p /home/ubuntu/.ssh \
    && chown ubuntu:ubuntu /home/ubuntu/.ssh \
    && chmod 700 /home/ubuntu/.ssh \
    && mkdir -p /var/run/sshd

ADD keys/docker_key.pub /home/ubuntu/.ssh/authorized_keys
ADD config/supervisord/supervisord.conf /supervisord.conf
RUN chmod 644 /home/ubuntu/.ssh/authorized_keys \
    && chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys \
    && touch /var/log/lastlog

EXPOSE 22

CMD supervisord -c /supervisord.conf
