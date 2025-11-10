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

# First clean up existing configuration
echo '' > /var/lib/unbound/unbound_ext.conf
# Add blocklist domains with forward-addr to a blackhole (localhost:53)
# This effectively blocks these domains by sending them to nowhere
sed '/./s/.*/local-zone: \"&\" always_nxdomain/' /root/TP4OpenW/lists/blocklist >> /var/lib/unbound/unbound_ext.conf
#sed '/./s/.*/local-data: \"& A 0.0.0.0\"\nlocal-data: \"& AAAA ::1\"/' /root/TP4OpenW/lists/blocklist >> /var/lib/unbound/unbound_ext.conf

# Add regular list domains
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/TP4OpenW/lists/list >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/TP4OpenW/lists/custom >> /var/lib/unbound/unbound_ext.conf
sed "s/.*/forward-zone:\n        name: \"&\"\n        forward-addr: 127.0.0.1@45353/" /root/custom.list >> /var/lib/unbound/unbound_ext.conf



echo 'Generate /tmp/dnsmasq.d/gfwlist.conf...'
echo '' > /tmp/dnsmasq.d/gfwlist.conf

# Add regular list domains to gfwlist
sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/TP4OpenW/lists/list >> /tmp/dnsmasq.d/gfwlist.conf
sed "s/.*/ipset=\/&\/gfwlist/" /root/TP4OpenW/lists/list >> /tmp/dnsmasq.d/gfwlist.conf

sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/TP4OpenW/lists/custom >> /tmp/dnsmasq.d/gfwlist.conf
sed "s/.*/ipset=\/&\/gfwlist/" /root/TP4OpenW/lists/custom >> /tmp/dnsmasq.d/gfwlist.conf

FILE=/root/custom.list
if test -f "$FILE"; then
  sed "s/.*/server=\/&\/127.0.0.1#45355/" /root/custom.list >> /tmp/dnsmasq.d/gfwlist.conf
  sed "s/.*/ipset=\/&\/gfwlist/" /root/custom.list >> /tmp/dnsmasq.d/gfwlist.conf
fi

# Create blocklist configuration for dnsmasq
echo 'Generate /tmp/dnsmasq.d/blocklist.conf...'
echo '' > /tmp/dnsmasq.d/blocklist.conf

# Block the domains by returning NXDOMAIN or blackhole DNS response
# This can be achieved by redirecting to a blackhole address
# But more effective approach is to use dnsmasq's address=/domain/ format
sed '/./s/.*/address=\/&\/0.0.0.0/' /root/TP4OpenW/lists/blocklist >> /tmp/dnsmasq.d/blocklist.conf

/etc/init.d/dnsmasq restart
echo "Success."

