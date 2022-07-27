FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-client \
	sudo \
	wget && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN adduser www-data && usermod -a -G sudo www-data

COPY ./tools/install_wp.sh /
RUN chmod +x install_wp.sh
RUN bash install_wp.sh
RUN rm -rf install_wp.sh

CMD ["php-fpm7.3", "-F"]
