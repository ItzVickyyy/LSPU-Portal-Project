FROM php:8.2-apache

# Enable mysqli extension
RUN docker-php-ext-install mysqli

# Copy all project files to Apache web root
COPY . /var/www/html/

# Apache listens on port 80 by default
EXPOSE 80
