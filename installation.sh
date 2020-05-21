#!/bin/sh

opkg install openssh-client openssh-keygen autossh redsocks ipset iptables-mod-nat-extra ttyd luci-app-ttyd isc-dhcp-server-ipv4 luci-app-unbound
opkg remove dnsmasq
/etc/init.d/unbound restart

cp /root/TP4OpenW/etc/rc.local /etc/rc.local
cp /root/TP4OpenW/etc/redsocks.conf /etc/redsocks.conf
cp /root/TP4OpenW/etc/crontabs/root /etc/crontabs/root
cp /root/TP4OpenW/etc/config/autossh /etc/config/autossh

touch /root/custom.list

ssh-keygen
