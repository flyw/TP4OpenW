#!/bin/sh
apt update
apt install autossh dante-server -y
systemctl enable danted

cp danted.conf /etc/danted.conf
cp startService.sh /root/startService.sh
systemctl restart danted

line="@reboot /root/startService.sh"
(crontab -u root -l; echo "$line" ) | crontab -u root -

ssh-keygen
echo "Run ssh-copy-id [%]"
