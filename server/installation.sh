#!/bin/sh
apt update
apt install autossh dante-server socat -y
systemctl enable danted

ssh-keygen
ssh-copy-id [%]
