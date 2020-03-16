# config-openwrt

### Install Required Packages
> At least 10M free space is required.
```bash
opkg update
opkg install openssh-server openssh-client openssh-keygen autossh socat redsocks ipset python
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
curl -sL https://raw.githubusercontent.com/flyw/config-openwrt/master/tinylist-to-dnsmasq.py | sudo bash -


  

### Start Services On Starup
```bash
# Put your custom commands here that should be executed once
# the system init finished. By default this file does nothing.

sleep 10
touch /tmp/system-startup
autossh -M 60000 -f -C -L 0.0.0.0:49080:localhost:49080 -N root@[UPSTREAM_IP]
autossh -M 60002 -f -C -L 5353:localhost:5353 -N root@[UPSTREAM_IP]
socat udp4-listen:55,reuseaddr,fork tcp:localhost:5353 &

exit 0
```

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1

