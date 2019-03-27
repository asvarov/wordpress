FROM ubuntu:18.04

RUN apt update && apt install -y \
    nginx \
 && rm -rf /var/lib/apt/lists/*

COPY ./configs/nginx/1f.lab.int.conf /etc/nginx/sites-enabled/1f.lab.int.conf
RUN ["rm", "-f", "/etc/nginx/sites-enabled/default;"]
RUN ["ln", "-s", "/etc/nginx/sites-available/1f.lab.int.conf /etc/nginx/sites-enabled/;"]

EXPOSE 80/tcp

CMD ["nginx", "-g", "daemon off;"]
