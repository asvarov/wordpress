FROM php:7.2-fpm-alpine3.8
# Create config with directive "listen = 0.0.0.0:9000"
#COPY ./configs/php-fpm/www.conf /etc/php/7.2/fpm/pool.d/
#ENTRYPOINT ["/usr/sbin/php-fpm7.2","--allow-to-run-as-root","-c","/etc/php/7.2/fpm","--nodaemonize"]
