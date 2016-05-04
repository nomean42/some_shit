#!/usr/bin/env bash
#/etc/nginx/nginx.conf
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf
#sudo sed -i '$ a \\n1' /etc/nginx/nginx.conf
NGINGSCONF='/etc/nginx/nginx.conf'
sudo rm $NGINGSCONF
sudo touch $NGINGSCONF
sudo chmod -R 777 $NGINGSCONF
echo '\nworker_processes 1;' >> $NGINGSCONF
echo '\nevents {' >> $NGINGSCONF
echo '\tworker_connections  1024;' >> $NGINGSCONF
echo '}' >> $NGINGSCONF
echo '\nhttp {' >> $NGINGSCONF
echo '\tserver {' >> $NGINGSCONF
echo '\t\tlisten 80;' >> $NGINGSCONF
