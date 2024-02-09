FROM postgres:10.3

COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY up.sql /docker-entrypoint-initdb.d/1.sql

CMD ["postgres"]