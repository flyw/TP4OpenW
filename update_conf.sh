#!/bin/sh

#forward-zone:
#        name: "baidu.com"
#        forward-addr: 192.168.99.1@45353
#forward-zone:
#        name: "sina.com.cn"
#        forward-addr: 192.168.99.1@45353

echo 'Generate /var/lib/unbound/unbound_ext.conf...'
cp /etc/unbound/unbound_ext.conf /var/lib/unbound/unbound_ext.conf
chown unbound:unbound /var/lib/unbound/unbound_ext.conf

sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 192.168.99.1@45353/" /root/TP4OpenW/lists/list >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 192.168.99.1@45353/" /root/TP4OpenW/lists/custom >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 192.168.99.1@45353/" /root/custom >> /var/lib/unbound/unbound_ext.conf

/etc/init.d/unbound restart
echo "Success."

