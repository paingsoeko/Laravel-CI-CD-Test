# Dockerfile

FROM php:8.3-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    && docker-php-ext-install pdo mbstring zip exif pcntl bcmath gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install --no-dev --no-scripts --prefer-dist

EXPOSE 9000
CMD ["php-fpm"]
