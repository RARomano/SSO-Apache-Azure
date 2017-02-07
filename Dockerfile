FROM httpd:2.4

RUN apt-get update && apt-get install -y libapache2-mod-auth-openidc

COPY ./html /usr/local/apache2/htdocs
COPY ./apache2.config /usr/local/apache2/conf/httpd.conf

EXPOSE 80

CMD httpd-foreground