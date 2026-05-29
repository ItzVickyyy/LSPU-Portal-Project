FROM php:8.2-apache

# Fix "More than one MPM loaded" error
RUN rm -f /etc/apache2/mods-enabled/mpm_event.load \
          /etc/apache2/mods-enabled/mpm_event.conf \
          /etc/apache2/mods-enabled/mpm_worker.load \
          /etc/apache2/mods-enabled/mpm_worker.conf && \
    a2enmod mpm_prefork rewrite

# Enable mysqli extension
RUN docker-php-ext-install mysqli

# Copy all project files to Apache web root
COPY . /var/www/html/

EXPOSE 80

CMD ["apache2-foreground"]