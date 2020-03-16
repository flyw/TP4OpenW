#!/bin/sh

# ./create_dnsmasq_conf.sh [filename]

file="$1"

if [ $# -eq 0 ]
  then
    echo "Missing file: ./create_dnsmasq_conf.sh [filename]"
    exit 0
fi


echo 'start'
echo '' > dnsmasq.conf
sed "s/.*/server=\/&\/127.0.0.1#55/" $file >> dnsmasq.conf
sed "s/.*/ipset=\/&\/gfwlist/" $file >> dnsmasq.conf
