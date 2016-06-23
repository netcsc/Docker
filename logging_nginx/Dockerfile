FROM nginx

RUN apt-get update && apt-get -y install apache2-utils

COPY default.conf /etc/nginx/conf.d/default.conf
COPY init.sh /root/init.sh
COPY domain.crt /etc/nginx/conf.d/domain.crt
COPY domain.key /etc/nginx/conf.d/domain.key

ENTRYPOINT ["/root/init.sh"]
