# OpenWRT-TSP

### Install Required Packages
```bash
wget https://raw.githubusercontent.com/flyw/OpenWRT-TSP/master/setup.sh
wget https://raw.githubusercontent.com/flyw/OpenWRT-TSP/master/create_dnsmasq_conf.sh
wget https://raw.githubusercontent.com/flyw/OpenWRT-TSP/master/tinylist
wget https://raw.githubusercontent.com/flyw/OpenWRT-TSP/master/rc.local

# wget http://git.joydata.com/snippets/25/raw

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

### UPDATE DNSMASQ
```bash

./create_dnsmasq_conf.sh tinylist
cat dnsmasq.conf >> /tmp/dnsmasq.d/tinylist.conf
```  

### Start Services On Starup
```bash
cd /tmp/tmp

cat rc.local > /etc/rc.local
```

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md
* https://github.com/cokebar/gfwlist2dnsmasq

