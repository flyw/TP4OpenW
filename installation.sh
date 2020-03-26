#!/bin/sh

opkg remove dnsmasq
opkg install dnsmasq-full
opkg install openssh-client openssh-keygen autossh redsocks ipset iptables-mod-nat-extra ttyd luci-app-ttyd
opkg install socat

# Install libustream tls
# opkg list | grep libustream | grep tls

#tls_line=$(opkg list | grep libustream | grep tls)
#tls_package=$(echo "$tls_line"  | head -n1 | cut -d " " -f1)
#opkg install ${tls_package}

cp etc/rc.local /etc/rc.local
cp etc/redsocks.conf /etc/redsocks.conf
cp etc/crontabs/root /etc/crontabs/root

ssh-keygen
