#!/usr/bin/env bash
NGINGSCONF='/etc/nginx/nginx.conf'
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
	echo '\t\t}' >> $NGINGSCONFNF