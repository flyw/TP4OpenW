# TP4OpenW

### Install

```bash
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
opkg update
tls_line=$(opkg list | grep libustream | grep tls)
tls_package=$(echo "$tls_line"  | head -n1 | cut -d " " -f1)
opkg install ${tls_package}
opkg install unzip
wget https://github.com/flyw/TP4OpenW/archive/master.zip -O master.zip
unzip master.zip
mv TP4OpenW-master TP4OpenW
/root/TP4OpenW/installation.sh
```

### Config autossh
> ON ROUTE
  ```bash
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

### Config 

```bash
vi /etc/config/autossh
# Update [UPSTREAM_IP]
reboot
```

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md
* https://github.com/cokebar/gfwlist2dnsmasq
