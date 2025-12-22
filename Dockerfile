FROM wordpress:php8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git unzip curl zip less nano \
    libzip-dev libonig-dev libpng-dev libicu-dev libxml2-dev \
    && docker-php-ext-install \
    zip intl gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 18 + npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest yarn
	
	
# Set npm cache directory
ENV NPM_CONFIG_CACHE=/root/.npm	

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    -- --install-dir=/usr/local/bin --filename=composer

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
