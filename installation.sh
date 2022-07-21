#!/bin/sh

opkg install openssh-client openssh-keygen autossh redsocks ipset iptables-mod-nat-extra ttyd luci-app-ttyd unbound-daemon bind-dig bind-libs
opkg remove dnsmasq
opkg install dnsmasq-full
sed -i 's/=53/=45355/g' /usr/lib/unbound/unbound.sh
sed -i 's/ 53/ 45355/g' /usr/lib/unbound/unbound.sh
sed -i 's/"53"/"45355"/g' /usr/lib/unbound/unbound.sh
sed -i 's/echo "server:"/echo "server:"\n    echo "  tcp-upstream: yes"/g' /usr/lib/unbound/unbound.sh
sed -i 's/echo "server:"/echo "server:"\n    echo "  do-not-query-localhost: no"/g' /usr/lib/unbound/unbound.sh
sed -i 's/cp -p \/etc\/unbound\/\* $UB_VARDIR\//cp -p \/etc\/unbound\/* $UB_VARDIR\/\n  \/root\/TP4OpenW\/update_conf.sh/g' /usr/lib/unbound/unbound.sh
/etc/init.d/unbound restart

cp /root/TP4OpenW/etc/rc.local /etc/rc.local
cp /root/TP4OpenW/etc/redsocks.conf /etc/redsocks.conf
cp /root/TP4OpenW/etc/crontabs/root /etc/crontabs/root
cp /root/TP4OpenW/etc/config/autossh /etc/config/autossh

touch /root/custom.list

ssh-keygen
