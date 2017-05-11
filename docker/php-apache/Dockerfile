FROM ubuntu:14.04
MAINTAINER StackInstance <info@stackinstance.com>

RUN apt-get -yqq update
RUN apt-get -yqq install apache2 curl git php5 php5-gd php5-mysql php5-curl php5-mcrypt php5-xmlrpc php5-imagick php5-apcu php5-intl php5-xdebug

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN php5enmod gd mysql curl mcrypt xmlrpc imagick apcu intl
RUN a2enmod expires ssl rewrite headers mime_magic vhost_alias

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR /var/www
RUN chown $APACHE_RUN_USER:$APACHE_RUN_GROUP /var/www

ADD website.conf /etc/apache2/sites-available/

RUN ln -s /etc/apache2/sites-available/website.conf /etc/apache2/sites-enabled/website.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf

COPY 20-xdebug.ini /etc/php5/cli/conf.d/20-xdebug.ini

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apache2" ]
CMD ["-D", "FOREGROUND"]
