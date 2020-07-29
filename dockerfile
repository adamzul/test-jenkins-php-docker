FROM php:7.1-apache
RUN apt-get update
RUN apt-get install nano

RUN apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y  --no-install-recommends apt-utils libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev libmcrypt-dev 

RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
    --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install gd

RUN apt-get -yqq install exiftool
RUN docker-php-ext-configure exif

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install exif
RUN docker-php-ext-install sockets 
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-enable exif
RUN docker-php-ext-enable sockets
RUN docker-php-ext-enable bcmath
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-enable pdo_mysql

RUN apt-get update && \
    apt-get install -y git zip unzip && \
    php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 80
