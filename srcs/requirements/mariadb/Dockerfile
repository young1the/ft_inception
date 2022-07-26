FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/create_user.sh /
RUN bash ./create_user.sh
RUN rm -rf create_user.sh

CMD ["mysqld_safe"]
