FROM ubuntu:18.04

RUN apt update && apt install -y \
    php-fpm \
    php-curl \
    php-mysql \
    php-gd \
    php-mbstring \
    php-xml \
    php-xmlrpc \
 && rm -rf /var/lib/apt/lists/*

CMD echo "cgi.fix_pathinfo=0" > /etc/php/7.2/fpm/php.ini
CMD echo "upload_max_filesize = 500M" > /etc/php/7.2/fpm/php.ini
CMD echo "post_max_size = 2000M" > /etc/php/7.2/fpm/php.ini
CMD echo "memory_limit = 2000M" > /etc/php/7.2/fpm/php.ini
CMD echo "cmax_execution_time = 120" > /etc/php/7.2/fpm/php.ini

# Create config with directive "listen = 0.0.0.0:9000"
COPY ./configs/php-fpm/www.conf /etc/php/7.2/fpm/pool.d/

WORKDIR /code

EXPOSE 9000/tcp

ENTRYPOINT ["/usr/sbin/php-fpm7.2","--allow-to-run-as-root","-c","/etc/php/7.2/fpm","--nodaemonize"]