FROM php:8.3-apache

RUN docker-php-ext-install mysqli

RUN sed -i 's/^ServerTokens .*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf \
    && sed -i 's/^ServerSignature .*/ServerSignature Off/' /etc/apache2/conf-available/security.conf

RUN printf "expose_php = Off\n" > /usr/local/etc/php/conf.d/security.ini

COPY src/ /var/www/html/
