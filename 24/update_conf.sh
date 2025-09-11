#!/bin/sh

#forward-zone:
#        name: "google.com"
#        forward-addr: 127.0.0.1@45353
#forward-zone:
#        name: "sina.com.cn"
#        forward-addr: 192.168.99.1@45353

#do-not-query-localhost: no

# echo 'Generate /var/lib/unbound/unbound_ext.conf...'
# cp /etc/unbound/unbound_ext.conf /var/lib/unbound/unbound_ext.conf
# chown unbound:unbound /var/lib/unbound/unbound_ext.conf

sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/TP4OpenW/lists/list >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/TP4OpenW/lists/custom >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/custom.list >> /var/lib/unbound/unbound_ext.conf

echo 'Generate /etc/dnsmasq.d/gfwlist.conf...'
mkdir -p /etc/dnsmasq.d
echo '' > /etc/dnsmasq.d/gfwlist.conf
sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/TP4OpenW/lists/list >> /etc/dnsmasq.d/gfwlist.conf
sed "s/.*/ipset=\/&\/gfwlist/" /root/TP4OpenW/lists/list >> /etc/dnsmasq.d/gfwlist.conf

sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/TP4OpenW/lists/custom >> /etc/dnsmasq.d/gfwlist.conf
sed "s/.*/ipset=\/&\/gfwlist/" /root/TP4OpenW/lists/custom >> /etc/dnsmasq.d/gfwlist.conf

FILE=/root/custom.list
if test -f "$FILE"; then
  sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/custom.list >> /etc/dnsmasq.d/gfwlist.conf
  sed "s/.*/ipset=\/&\/gfwlist/" /root/custom.list >> /etc/dnsmasq.d/gfwlist.conf
fi

/etc/init.d/dnsmasq restart
echo "Success."

