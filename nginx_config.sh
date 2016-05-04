#!/bin/bash 

SHORT_NAME=$1
PROJECT_NAME=$2
NGINX_CONF=$3
BUILD_PATH=/vol/builds/$PROJECT_NAME
DIST_PATH=dist
	#lg
		echo '		location /'$SHORT_NAME'/lg {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/lg;' >> $NGINX_CONF
		echo '	 	}' >> $NGINX_CONF
	#webos
		echo '		location /'$SHORT_NAME'/webos {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/webos;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#dune
		echo '		location /'$SHORT_NAME'/dune {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/dune/src/www;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#samsung
		echo '		location /'$SHORT_NAME'/samsung {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/samsung/src;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#pc
		echo '		location /'$SHORT_NAME'/pc {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/pc;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#mag250
		echo '		location /'$SHORT_NAME'/mag250 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/mag250;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#tvip
		echo '		location /'$SHORT_NAME'/tvip {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/tvip;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
	#eltex_v100
		echo '		location /'$SHORT_NAME'/eltex/v100 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/eltex/v10x;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
    	#eltex_v300
		echo '		location /'$SHORT_NAME'/eltex/v300 {' >> $NGINX_CONF
		echo '			alias '$BUILD_PATH'/'$SHORT_NAME'/eltex/v300;' >> $NGINX_CONF
		echo '		}' >> $NGINX_CONF
