FROM php:7.4-fpm-alpine

RUN apk add --update \
    git \
    icu-dev \
	mariadb-client \
	npm \
    && rm -rf /var/cache/apk/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN docker-php-ext-install intl pdo_mysql

COPY php.ini /usr/local/etc/php/conf.d/custom.ini

RUN mkdir -p /code

WORKDIR /code
