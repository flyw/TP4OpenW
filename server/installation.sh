#!/bin/sh
apt update
apt install autossh dante-server socat -y
systemctl enable danted

cp danted.conf /etc/danted.conf
cp startService.sh /root/startService.sh
chmod a+x /root/startService.sh
systemctl restart danted

line="0 * * * * killall -9 socat; socat tcp4-listen:5353,bind=127.0.0.1,reuseaddr,fork UDP:127.0.0.53:53 &"
(crontab -u root -l; echo "$line" ) | crontab -u root -
line="@reboot /root/startService.sh"
(crontab -u root -l; echo "$line" ) | crontab -u root -

ssh-keygen
echo "Run ssh-copy-id [%]"
