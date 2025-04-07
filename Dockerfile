FROM wordpress:latest

# Copia a pasta wp_data para dentro do container
COPY wp_data /var/www/html/wp_data

# Permissão para WordPress poder acessar
RUN chown -R www-data:www-data /var/www/html/wp_data

