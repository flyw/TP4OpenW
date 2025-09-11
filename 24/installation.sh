#!/bin/sh

opkg install openssh-client openssh-keygen autossh ipset iptables-mod-nat-extra unbound-daemon
opkg install /root/TP4OpenW/24/redsocks-dev_0.5-20161228-r1_mipsel_24kc.ipk
opkg remove dnsmasq
opkg install dnsmasq-full
sed -i 's/=53/=45355/g' /usr/lib/unbound/unbound.sh
sed -i 's/ 53/ 45355/g' /usr/lib/unbound/unbound.sh
sed -i 's/"53"/"45355"/g' /usr/lib/unbound/unbound.sh
sed -i '/echo "server:"/a \
    echo "  tcp-upstream: yes"' /usr/lib/unbound/unbound.sh
sed -i '/echo "server:"/a \
    echo "  do-not-query-localhost: no"' /usr/lib/unbound/unbound.sh
sed -i '\|  cp -p $UB_ETCDIR/root\.\* $UB_VARDIR/|a \  /root/TP4OpenW/update_conf.sh' /usr/lib/unbound/unbound.sh
/etc/init.d/unbound restart

cp /root/TP4OpenW/24/etc/rc.local /etc/rc.local
cp /root/TP4OpenW/etc/redsocks.conf /etc/redsocks.conf
cp /root/TP4OpenW/etc/crontabs/root /etc/crontabs/root
cp /root/TP4OpenW/etc/config/autossh /etc/config/autossh

touch /root/custom.list

ssh-keygen -t rsa
