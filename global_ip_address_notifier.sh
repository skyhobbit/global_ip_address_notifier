#!/bin/sh
 
ip_address=$(curl -s ifconfig.io)
past_ip_address=$(cat /tmp/global_ip_address_notifier)
 
if [ ${ip_address} != ${past_ip_address} ]; then
  echo "IPアドレスは${ip_address}に更新されました"
  echo ${ip_address} > /tmp/global_ip_address_notifier
fi
