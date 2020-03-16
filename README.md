# config-openwrt

### Install Required Packages
> At least 10M free space is required.
```bash
opkg update
opkg install openssh-server openssh-client openssh-keygen autossh socat redsocks ipset
opkg list | grep libustream | grep tls
# 安装 tls 扩展，该扩展用于 wget https 
opkg install libustream-mbedtls20150806
```

### Config autossh
> ON ROUTE
  ```bash
  ssh-keygen
  scp /root/.ssh/id_rsa.pub root@[UPSTREAM_IP]:/tmp/id_rsa.pub
  ```
> ON UPSTREAM_SERVER
  ```bash
  cat /tmp/id_rsa.pub >> /root/authorized_keys
  ```
> ON ROUTE
  ```bash
  ssh root@[UPSTREAM_IP]
  ```

### UPDATE DNSMASQ
```bash

cd /tmp/tmp
wget https://raw.githubusercontent.com/flyw/config-openwrt/master/tinylist?token=AAFIQOBI32IZMHKKH2MQAGS6N4VVK
# wget http://git.joydata.com/snippets/25/raw
wget https://raw.githubusercontent.com/flyw/config-openwrt/master/create_dnsmasq_conf.sh?token=AAFIQOHWKFDPNUDKODMDK626N4VSW
chmod a+x create_dnsmasq_conf.sh
./create_dnsmasq_conf.sh tinylist
cat dnsmasq.conf >> /etc/dnsmasq.conf
```  

### Start Services On Starup
```bash
cd /tmp/tmp
wget https://raw.githubusercontent.com/flyw/config-openwrt/master/rc.local?token=AAFIQOAD5CSLCPQOH6LHGDS6N4SHO
cat rc.local > /etc/rc.local
```

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md

