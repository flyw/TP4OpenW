# TP4OpenW

### Install

```bash
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
opkg update
opkg install git-http
git clone https://github.com/flyw/TP4OpenW.git
cd TP4OpenW
chmod a+x *.sh
./installation.sh
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

### Config rc.local

```bash
vi /etc/rc.local
```

```conf
/root/TP4OpenW/startup.sh /root/TPOpenW/tinylist
# /root/TP4OpenW/startup.sh /root/TPOpenW/fulllist
```  


### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md
* https://github.com/cokebar/gfwlist2dnsmasq

