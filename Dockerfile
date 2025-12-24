FROM wordpress:php8.2-apache

# 1. Install system dependencies
RUN apt-get update && apt-get install -y \
    git unzip curl zip less nano \
    ca-certificates gnupg \
    libzip-dev libonig-dev libpng-dev libicu-dev libxml2-dev \
    && docker-php-ext-install zip intl gd \
    && rm -rf /var/lib/apt/lists/*

# 2. Install STABLE Node.js (LTS)
# Using 'setup_lts.x' ensures you get the most reliable version (currently v24)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# 3. Verify installations
RUN node -v && npm -v

# 4. Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# 5. Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && echo "alias wp='wp --allow-root'" >> ~/.bashrc

WORKDIR /var/www/html