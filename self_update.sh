#!/bin/sh

wget https://github.com/flyw/TP4OpenW/archive/master.zip -O /root/master.zip
cd /root
unzip master.zip
mv TP4OpenW-master TP4OpenW
cp /root/TP4OpenW/etc/crontabs/root /etc/crontabs/root
