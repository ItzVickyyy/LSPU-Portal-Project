FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, PHP, and required extensions
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysqli \
    php-curl \
    libapache2-mod-php \
    && apt-get clean

# Enable mpm_prefork and rewrite
RUN a2dismod mpm_event mpm_worker 2>/dev/null || true && \
    a2enmod mpm_prefork php8.1 rewrite

# Copy project files
COPY . /var/www/html/

# Remove default Apache page
RUN rm -f /var/www/html/index.html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]