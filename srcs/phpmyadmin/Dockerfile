FROM alpine

USER root

COPY install.sh /tmp/install.sh
COPY config.inc.php /var/www/localhost/htdocs/config.inc.php
ADD  http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz /tmp/

RUN sh /tmp/install.sh && rm -f /tmp/install.sh

EXPOSE 80 

ENTRYPOINT lighttpd -D -f /etc/lighttpd/lighttpd.conf
