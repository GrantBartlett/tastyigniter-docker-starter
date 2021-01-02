# PHP-FPM is a FastCGI implementation for PHP.
# Read more here: https://hub.docker.com/_/php
FROM php:7.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    unzip \
    libzip-dev \
    git

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql exif pcntl bcmath gd zip \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setup web user
# --groups - Specify the groups we want our new user to be added to.
# --uid - Add a non system account (i.e not < 1000)
# --home - Specify path for the users home directory
RUN useradd --groups www-data --uid 1000 --home /home/www-user www-user

# Setup composer & site folders
# --parents - Make parent directories as needed
# chown:owner:group - Change the group owner of our files  
# --recursive - Operate on all files and directories recursively 
RUN mkdir --parents /home/www-user/.composer && \
    mkdir /home/www-user/site && \
    chown --recursive www-user:www-user /home/www-user

# Set working directory
WORKDIR /home/www-user/site

# Ensure our user is not root
USER www-user