FROM alpine

COPY wp-config.php /var/www/localhost/htdocs/wp-config.php

ADD https://fr.wordpress.org/latest-fr_FR.tar.gz /tmp/

RUN apk update && \
    apk add lighttpd \
    php7 php7-openssl php7-cgi php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli\
    php7-zlib php7-json --no-cache && \
    tar -xf /tmp/latest-fr_FR.tar.gz --strip-components=1 -C /var/www/localhost/htdocs && \
    rm -f /var/www/localhost/htdocs/wp-config-sample.php && \
    rm -f /var/www/localhost/htdocs/license.txt && \
    rm -f /var/www/localhost/htdocs/readme.html && \
    rm -f /tmp/latest-fr_FR.tar.gz && \
    mkdir -p /var/www/localhost/htdocs/tmp && \
    chmod 755 /var/www/localhost/htdocs/tmp && \
    chmod 755 -R /var/www/localhost/htdocs/* && \
    mkdir -p /var/run/lighttpd && \
    touch /var/run/lighttpd/php-fastcgi.socket && \
    chown -R lighttpd:lighttpd /var/run/lighttpd && \
    sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' /etc/lighttpd/lighttpd.conf && \
    sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf && \
    sed -i 's/\/usr\/bin\/php-cgi/\/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

EXPOSE 80

ENTRYPOINT lighttpd -D -f /etc/lighttpd/lighttpd.conf
