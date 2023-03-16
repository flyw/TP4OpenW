#!/bin/sh
touch /tmp/system-startup

#socat tcp4-listen:5353,bind=127.0.0.1,reuseaddr,fork UDP:127.0.0.53:53 &
autossh -M 60102 -f -C -R 49080:localhost:1080 -o ServerAliveInterval=30 -o ServerAliveCountMax=2 -N root@[DOWNSTREAM_IP]
autossh -M 60103 -f -C -R 5353:localhost:5353 -o ServerAliveInterval=30 -o ServerAliveCountMax=2 -N root@[DOWNSTREAM_IP]

echo "reboot" | at 5:00
