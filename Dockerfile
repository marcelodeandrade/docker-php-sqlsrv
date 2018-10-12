FROM ubuntu:16.04

LABEL author="Marcelo de Andrade (andrade.asmarcelo@gmail.com)"

ARG DEBIAN_FRONTEND=noninteractive

# UPDATE PACKAGES
RUN apt-get update

# INSTALL SYSTEM UTILITIES
RUN apt-get install -y \
    apt-utils \
    curl \
    git \
    apt-transport-https \
    software-properties-common \
    python-software-properties \
    g++ \
    build-essential \
    dialog

# INSTALL APACHE2
RUN apt-get install -y apache2
RUN a2enmod rewrite

# INSTALL locales
RUN apt-get install -qy language-pack-en-base \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# INSTALL PHP & LIBRARIES
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    php-pear \
    php7.2 \
    php7.2-common \
    php7.2-mbstring \
    php7.2-dev \
    php7.2-xml \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-curl \
    php7.2-gd \
    php7.2-imagick \
    php7.2-xdebug \
    php7.2-xml \
    php7.2-zip \
    php7.2-odbc \
    libapache2-mod-php7.2

RUN pecl install xdebug
RUN echo "zend_extension=xdebug.so" > /etc/php/7.2/cli/conf.d/20-xdebug.ini
RUN echo "zend_extension=xdebug.so" > /etc/php/7.2/apache2/conf.d/20-xdebug.ini
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# INSTALL ODBC DRIVER & TOOLS
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y \
    msodbcsql \
    mssql-tools \
    unixodbc \
    unixodbc-dev
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN exec bash

# INSTALL & LOAD SQLSRV DRIVER & PDO
RUN pecl install sqlsrv
RUN echo ";priority=20\nextension=sqlsrv.so" > /etc/php/7.2/cli/conf.d/20-sqlsrv.ini
RUN echo ";priority=20\nextension=sqlsrv.so" > /etc/php/7.2/apache2/conf.d/20-sqlsrv.ini

RUN pecl install pdo_sqlsrv
RUN echo ";priority=30\nextension=pdo_sqlsrv.so" > /etc/php/7.2/cli/conf.d/30-pdo_sqlsrv.ini
RUN echo ";priority=30\nextension=pdo_sqlsrv.so" > /etc/php/7.2/apache2/conf.d/30-pdo_sqlsrv.ini

# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin/ --filename=composer
RUN chmod +x /usr/local/bin/composer

# INSTALL EDITORS
RUN apt-get update && apt-get install nano vim -y

EXPOSE 80

RUN rm -rf /var/www/html && ln -s /app/web/ /var/www/html || true

WORKDIR /app

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]