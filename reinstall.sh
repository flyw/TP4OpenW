#!/bin/sh

if test -f "/root/TP4OpenW/reinstall.sh"; then
    cp /root/TP4OpenW/reinstall.sh /root/reinstall.sh
fi

rm -f /root/master.zip
wget https://github.com/flyw/TP4OpenW/archive/master.zip -O /root/master.zip
unzip /root/master.zip -d /root
rm -rf /root/TP4OpenW
sleep 1
mv /root/TP4OpenW-master /root/TP4OpenW
cp /root/TP4OpenW/etc/crontabs/root /etc/crontabs/root
touch /root/custom.list
