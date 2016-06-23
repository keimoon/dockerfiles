FROM keimoon/common:latest

ENV REDIS_VERSION=3.2.1 REDIS_DATA=/data/redis

RUN groupadd -r --gid=768 redis && useradd -r -g redis --uid=768 redis
RUN wget -O /redis.tar.gz http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz && \
    tar xzf /redis.tar.gz && cd /redis-${REDIS_VERSION} && make && make install PREFIX=/usr/local && rm -rf /redis*

ADD redis.conf docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
EXPOSE 6379

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis"]
