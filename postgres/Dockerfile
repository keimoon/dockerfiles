FROM keimoon/dev:latest

ENV PG_MAJOR=9.5 PG_MINOR=9.5-2 PG_YUM=95 PGDATA=/data/postgres

RUN yum localinstall -y https://download.postgresql.org/pub/repos/yum/${PG_MAJOR}/redhat/rhel-7-x86_64/pgdg-centos${PG_YUM}-${PG_MINOR}.noarch.rpm && \
    yum install -y postgresql${PG_YUM} postgresql${PG_YUM}-server && \
    mkdir -p ${PGDATA} && chown postgres:postgres ${PGDATA}

USER postgres
RUN /usr/pgsql-9.5/bin/initdb
