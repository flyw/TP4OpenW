# TP4OpenW

### Install

```bash
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
opkg update
opkg install openssh-client unzip
scp %:/tmp/master.zip .
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

### Config Redsocks
```bash
vi /etc/redsocks.conf
reboot
```

### Config rc.local

```bash
cp /root/TP4OpenW/rc.local.example /etc/rc.local
vi /etc/rc.local
reboot
```

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md
* https://github.com/cokebar/gfwlist2dnsmasq
