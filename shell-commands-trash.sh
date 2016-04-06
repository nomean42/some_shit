#!/usr/bin/env bash
#parse last tag without changeset, without 'v'
TAG=$(hg tags | grep -m1 -e 'v[[:digit:]].[[:digit:]].[[:digit:]]*' | sudo sed 's/[[:digit:]][[:digit:]][[:digit:]][[:digit:]].*$//' | sudo sed 's/v//'

find -maxdepth 1 -type d | grep '[[:digit:]][[:digit:]]\?.[[:digit:]][[:digit:]]\?.[[:digit:]][[:digit:]]\?' | sudo sed 's/\.\///'




PROJECT_NAME=applauncher
NGINX_CONF=/etc/nginx/nginx.conf
BUILD_PATH=/vol/builds/$PROJECT_NAME
DIST_PATH=dist

zb build all
SHORT_NAME=$(hg branch|grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?'|sed 's/\///')
rm -rf $BUILD_PATH/$SHORT_NAME
mkdir -p $BUILD_PATH/$SHORT_NAME
cp -r $DIST_PATH/*/* $BUILD_PATH/$SHORT_NAME


PROJECT_START=$(grep -no "#"$PROJECT_NAME"_start" $NGINX_CONF | sed -e s/:#"$PROJECT_NAME"_start//)
PROJECT_END=$(grep -no "#"$PROJECT_NAME"_end" $NGINX_CONF | sed -e s/:#"$PROJECT_NAME"_end//)
if [ $PROJECT_START ]; then
sed -e ''$PROJECT_START','$PROJECT_END'd' $NGINX_CONF > ~/temp
cat ~/temp > $NGINX_CONF
fi

echo 'worker_processes 1;' >> $NGINX_CONF;
echo 'events {' >> $NGINX_CONF;
echo '	worker_connections  1024;' >> $NGINX_CONF;
echo '}' >> $NGINX_CONF;
echo 'http {' >> $NGINX_CONF;
echo '#'$PROJECT_NAME'_start' >> $NGINX_CONF;
echo '	server {' >> $NGINX_CONF;
echo '		listen 80;' >> $NGINX_CONF;
echo '		server_name '$PROJECT_NAME';' >> $NGINX_CONF;

hg branches | grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?' | sed 's/\///' | while read SHORT_NAME
do
	lg
		echo '		location /'$SHORT_NAME'/lg {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/lg;' >> $NGINX_CONF
		echo '	 	}' >> $NGINX_CONF
	webos
		echo '		location /'$SHORT_NAME'/webos {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/webos;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	dune
		echo '		location /'$SHORT_NAME'/dune {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/dune/src/www;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	samsung
		echo '		location /'$SHORT_NAME'/samsung {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/samsung/src;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	pc
		echo '		location /'$SHORT_NAME'/pc {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/pc;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	mag250
		echo '		location /'$SHORT_NAME'/mag250 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/mag250;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	tvip
		echo '		location /'$SHORT_NAME'/tvip {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/tvip;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	eltex_v100
		echo '		location /'$SHORT_NAME'/eltex/v100 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/eltex/v10x;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
    eltex_v300
		echo '		location /'$SHORT_NAME'/eltex/v300 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/eltex/v300;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
done

echo '	}' >> $NGINX_CONF
echo '#'$PROJECT_NAME'_end' >> $NGINX_CONF
echo '}' >> $NGINX_CONF;


if [ pgrep nginx ] > /dev/null ; then
	sudo nginx -s reload
else
	sudo nginx
fi


SMTP_HOST="smtp.yandex.ru"
SMTP_PORT="465"
SMTP_USER="kvazimoda@interfaced.ru"
SMTP_PASS="Yoh9aib9"
SMTP_FROM="noreply@interfaced.ru"



GOOD
prepare
npm i

test
gjslint --flagfile /vol/scripts/closure-linter.flags -r ./app/launcher/*/*/*

build
zb build all

cleanup
PROJECT_NAME=applauncher
NGINX_CONF=/etc/nginx/nginx.conf
BUILD_PATH=/vol/builds/$PROJECT_NAME
DIST_PATH=dist
SHORT_NAME=$(hg branch | grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?' | sed 's/\///')
rm -rf $BUILD_PATH/$SHORT_NAME
mkdir -p $BUILD_PATH/$SHORT_NAME
cp -r $DIST_PATH/*/* $BUILD_PATH/$SHORT_NAME

bash /vol/scripts/nginx_eraseold.sh $PROJECT_NAME $NGINX_CONF
bash /vol/scripts/nginx_hat.sh $PROJECT_NAME $NGINX_CONF
hg pull
hg branches | grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?' | sed 's/\///' | while read SHORT_NAME
do
bash /vol/scripts/nginx_config.sh $SHORT_NAME $PROJECT_NAME $NGINX_CONF
done
bash /vol/scripts/nginx_tail.sh $PROJECT_NAME $NGINX_CONF



delete
SHORT_NAMES=($(hg branch | grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?' | sed 's/\///'))
OLD_BUILDS=($(find $BUILD_PATH -maxdepth 1 -type d | grep -o '\/[0-9]\+\.\?[0-9]\+\.\?[0-9]\+\.\?' | sed 's/.*\///'))
if [ ${#OLD_BUILDS[@]} != ${#SHORT_NAMES[@]} ]; then
for FOLDER in ${OLD_BUILDS[@]}; do
	for
done;

fi
for i in "${MASS[@]}"; do echo '1'; done;
