#
# Nginx Dockerfile
#
# https://github.com/aegypius/docker-nginx
#

# Pull base image.
FROM aegypius/confd

# Install requirements
RUN apt-get update -qy && \
    apt-get install --no-install-recommends -qy software-properties-common

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/stable && \
    apt-get update -q && \
    apt-get install --no-install-recommends -qy nginx && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80 443

# Define default command.
CMD nginx
