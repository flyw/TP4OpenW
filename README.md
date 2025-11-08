# TP4OpenW

### Notice：

***This script works only on 19.07****

### Install

```bash
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
opkg update
tls_line=$(opkg list | grep libustream | grep tls)
tls_package=$(echo "$tls_line"  | head -n1 | cut -d " " -f1)
opkg install ${tls_package} unzip
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
  cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys
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

### Block Domain Feature
The script now supports blocking specific domains to prevent access. 
You can manage blocked domains in two ways:

#### Method 1: Using the domain manager script
```bash
# Block a domain
/root/TP4OpenW/domain_manager.sh block example.com

# Unblock a domain
/root/TP4OpenW/domain_manager.sh unblock example.com

# List blocked domains
/root/TP4OpenW/domain_manager.sh list-blocked

# List allowed domains
/root/TP4OpenW/domain_manager.sh list-allowed

# Show status
/root/TP4OpenW/domain_manager.sh status

# Synchronize configurations after manual changes to lists
/root/TP4OpenW/domain_manager.sh sync
```

#### Method 2: Manual editing
Edit the blocklist file directly:
```bash
vi /root/TP4OpenW/lists/blocklist
# Add one domain per line
```

After manual editing, run:
```bash
/root/TP4OpenW/update_conf.sh
```

### Lists location
- `/root/TP4OpenW/lists/list` - Main GFW list (auto-generated)
- `/root/TP4OpenW/lists/custom` - Custom proxy list
- `/root/TP4OpenW/lists/blocklist` - Domains to block
- `/root/custom.list` - Additional custom list

### References
* https://github.com/gfwlist/gfwlist
* https://snippets.cacher.io/snippet/c74f02a2b546ab0fbc6a#F1
* https://github.com/lixingcong/my-gfwlist/blob/master/README.md
* https://github.com/cokebar/gfwlist2dnsmasq
