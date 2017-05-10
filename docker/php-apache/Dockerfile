FROM centos:7

MAINTAINER StackInstance <info@stackinstance.com>

RUN yum -y install httpd mysql-devel mysql-libs mod_ssl
RUN yum -y install php php-cli php-ldap php-mbstring php-mcrypt php-mysql php-pear-MDB2-Driver-mysqli php-pecl-memcached php-xml php-gd
RUN yum -y update bash
RUN yum -y install yum clean all

#
# Global Apache configuration changes
#
RUN sed -i \
    -e 's~^ServerSignature On$~ServerSignature Off~g' \
    -e 's~^ServerTokens OS$~ServerTokens Prod~g' \
    -e 's~^#ExtendedStatus On$~ExtendedStatus On~g' \
    -e 's~^DirectoryIndex \(.*\)$~DirectoryIndex \1 index.php~g' \
    -e 's~^NameVirtualHost \(.*\)$~#NameVirtualHost \1~g' \
    /etc/httpd/conf/httpd.conf

#
# Disable Apache directory indexes
#
RUN sed -i \
    -e 's~^IndexOptions \(.*\)$~#IndexOptions \1~g' \
    -e 's~^IndexIgnore \(.*\)$~#IndexIgnore \1~g' \
    -e 's~^AddIconByEncoding \(.*\)$~#AddIconByEncoding \1~g' \
    -e 's~^AddIconByType \(.*\)$~#AddIconByType \1~g' \
    -e 's~^AddIcon \(.*\)$~#AddIcon \1~g' \
    -e 's~^DefaultIcon \(.*\)$~#DefaultIcon \1~g' \
    -e 's~^ReadmeName \(.*\)$~#ReadmeName \1~g' \
    -e 's~^HeaderName \(.*\)$~#HeaderName \1~g' \
    -e 's/\/www\/html/\/www\/web/g' \
    /etc/httpd/conf/httpd.conf

ADD website.conf /etc/httpd/conf.d/

EXPOSE 80 443

CMD /usr/sbin/httpd -c "ErrorLog /dev/stdout" -DFOREGROUND
