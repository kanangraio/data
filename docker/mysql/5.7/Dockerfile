# Use the official MySQL image
FROM kanangraio/mysql:5.7

LABEL maintainer="ronald.bradford@kanangra.io"
LABEL version="0.4"
LABEL description="MySQL (5.7) Example Data Sets"

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=17aec94eed28513d
ENV MYSQL_DATABASE=kanangra
ENV MYSQL_SSL_CA=/var/lib/demo/ca.pem \
    MYSQL_SSL_CERT=/var/lib/demo/server-cert.pem \
    MYSQL_SSL_KEY=/var/lib/demo/server-key.pem


# Copy your SQL script into the Docker container
COPY 01-location.sql /docker-entrypoint-initdb.d/
COPY 02-airport.sql /docker-entrypoint-initdb.d/
COPY 57-baseline.sql /docker-entrypoint-initdb.d/
RUN mkdir /var/lib/demo
COPY server-cert.pem /var/lib/demo/server-cert.pem
COPY server-key.pem /var/lib/demo/server-key.pem
COPY ca.pem /var/lib/demo/ca.pem
COPY my.cnf /etc/mysql/conf.d/my.cnf

RUN chown mysql:mysql /var/lib/demo/*.pem && chmod 600 /var/lib/demo/*.pem

EXPOSE 3306
CMD ["mysqld"]
