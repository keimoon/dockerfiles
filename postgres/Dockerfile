FROM keimoon/common:latest

ENV PG_MAJOR=9.5 PG_MINOR=9.5-2 PG_YUM=95 PGDATA=/data/postgres

RUN groupadd -r postgres --gid=1999 && useradd -r -g postgres --uid=1999 postgres

RUN yum localinstall -y https://download.postgresql.org/pub/repos/yum/${PG_MAJOR}/redhat/rhel-7-x86_64/pgdg-centos${PG_YUM}-${PG_MINOR}.noarch.rpm && \
    yum install -y postgresql${PG_YUM} postgresql${PG_YUM}-server

ADD docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
EXPOSE 5432
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
