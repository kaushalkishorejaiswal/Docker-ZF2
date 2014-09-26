############################################################
# Dockerfile to build ZF2 and LAMP Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM kaushalkishore/docker-lamp-base

# File Author / Maintainer
MAINTAINER Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>

# Adding the Configuration File for host
ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Retrieve and Installing ZF2
RUN rm -rf /var/www/html/
RUN curl -sS https://getcomposer.org/installer | php
RUN php composer.phar create-project -sdev --repository-url="http://packages.zendframework.com" zendframework/skeleton-application /var/www/html/

# Set the port
EXPOSE 80 3306

# Execut the run.sh 
CMD ["/run.sh"]
