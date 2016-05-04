#!/bin/bash 
PROJECT_NAME=$1
NGINX_CONF=$2

PROJECT_START=$(grep -no "#"$PROJECT_NAME"_start" $NGINX_CONF | sed -e s/:#"$PROJECT_NAME"_start//)
PROJECT_END=$(grep -no "#"$PROJECT_NAME"_end" $NGINX_CONF | sed -e s/:#"$PROJECT_NAME"_end//)
if [ $PROJECT_START ]; then
sed '$d' $NGINX_CONF | sed -e ''$PROJECT_START','$PROJECT_END'd' > ~/temp
cat ~/temp > $NGINX_CONF
fi
