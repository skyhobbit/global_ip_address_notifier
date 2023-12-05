#!/bin/bash
 
ip_address=$(curl -s ifconfig.io)
if ! [ -e /tmp/global_ip_address_notifier ]; then
  touch /tmp/global_ip_address_notifier
fi
past_ip_address=$(cat /tmp/global_ip_address_notifier)
 
if [ "${ip_address}" != "${past_ip_address}" ]; then
  echo ${ip_address} | tee /tmp/global_ip_address_notifier
fi
