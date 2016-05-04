#!/bin/bash
PROJECT_NAME=$1
NGINX_CONF=$2

echo '#'$PROJECT_NAME'_start' >> $NGINX_CONF;
echo '  server {' >> $NGINX_CONF;
echo '          listen 80;' >> $NGINX_CONF;
echo '          server_name '$PROJECT_NAME';' >> $NGINX_CONF;
