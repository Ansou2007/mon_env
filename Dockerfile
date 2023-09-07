FROM php:8.2-apache
WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite

# Linux library
RUN apt-get update -y && apt-get install -y \
         libicu-dev \
         unzip zip 
         #libmariadb-dev \
         #libpng-dev  \
         #libjpeg-dev  \
         #libfreetype6-dev  \
         #libjpeg62-turbo-dev  \
         #libpng-dev-dev  

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install gettext intl pdo_mysql
