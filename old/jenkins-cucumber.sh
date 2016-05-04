#!/usr/bin/env bash
#build-script
BUILDPATH='/home/ifaced/builds'
NGINGSCONF='/etc/nginx/nginx.conf'
cp $PWD/app/app/persik/config/local-config.js.sample $PWD/app/app/persik/config/local-config.js
#zb build pc
#zb build samsung
#zb build mag250
#zb build dune
#zb build lg
#zb build webos
#
cd $PWD/app/dist/
find -maxdepth 1 -type d|grep -m 1 '[0-9]\+.[0-9]\+.[0-9]\+'|sudo sed 's/\.\///'|while read line
do
	#rm old versions
    rm -rf $BUILDPATH/$line

    #copy new versions
    cp -r $line $BUILDPATH/$line

	#rename *.html for mag
    if [ -d "$PWD/app/dist/$line/mag250" ]; then
		mv $BUILDPATH/$line/mag250/*.html $BUILDPATH/$line/mag250/index.html
	fi
#nginx-config-fill
	#lg
    echo '\n\t\tlocation '/$line'/lg {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/lg;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
    #webos
    echo '\n\t\tlocation '/$line'/webos {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/webos;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
    #dune
    echo '\n\t\tlocation '/$line'/dune {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/dune/src/www;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
    #samsung
    echo '\n\t\tlocation '/$line'/samsung {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/samsung/src;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
    #pc
    echo '\n\t\tlocation '/$line'/pc {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/pc;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
    #mag250
	echo '\n\t\tlocation '/$line'/mag250 {' >> $NGINGSCONF
	echo '\t\t\talias '$BUILDPATH'/'$line'/mag250;' >> $NGINGSCONF
	echo '\t\t}' >> $NGINGSCONF
done

#nginx-conf-close
echo '\t}' >> $NGINGSCONF
echo '}' >> $NGINGSCONF

#nginx-start
if pgrep "nginx"> /dev/null ; then
	sudo nginx -s reload
else
	sudo nginx
fi


