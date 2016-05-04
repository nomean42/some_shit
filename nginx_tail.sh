#!/bin/bash

PROJECT_NAME=$1
NGINX_CONF=$2

echo '  }' >> $NGINX_CONF
echo '#'$PROJECT_NAME'_end' >> $NGINX_CONF
echo '}' >> $NGINX_CONF;


if [ 'pgrep nginx' ] > /dev/null ; then
        sudo nginx -s reload
else
        sudo nginx
fi
