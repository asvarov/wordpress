FROM ubuntu:18.04

RUN apt update && apt install -y \
    nginx \
 && rm -rf /var/lib/apt/lists/*

COPY ./configs/nginx/1f.lab.int /etc/nginx/sites-available/
CMD ln -s /etc/nginx/sites-available/1f.lab.int /etc/nginx/sites-enabled/
CMD rm -f /etc/nginx/sites-enabled/default

EXPOSE 8080/tcp
