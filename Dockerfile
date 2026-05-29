
FROM php:8.2-apache
 
# Fix "More than one MPM loaded" error
RUN a2dismod mpm_event mpm_worker 2>/dev/null || true && \
    a2enmod mpm_prefork
 
# Enable mysqli extension
RUN docker-php-ext-install mysqli
 
# Enable Apache mod_rewrite
RUN a2enmod rewrite
 
# Copy all project files to Apache web root
COPY . /var/www/html/
 
# Apache listens on port 80 by default
EXPOSE 80