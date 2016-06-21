FROM keimoon/common:latest

ENV REDIS_VERSION 3.2.1

RUN groupadd redis && useradd -m -g redis redis && mkdir -p /data/redis && chown redis:redis /data/redis
USER redis
WORKDIR /home/redis
RUN wget -O redis.tar.gz http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz && \
    tar xzf redis.tar.gz && cd redis-${REDIS_VERSION} && make && make install PREFIX=/home/redis && cd .. && rm -rf redis*

ADD redis.conf /home/redis
USER root
RUN chown redis:redis /home/redis/redis.conf
USER redis
EXPOSE 6379
CMD /home/redis/bin/redis-server /home/redis/redis.conf
