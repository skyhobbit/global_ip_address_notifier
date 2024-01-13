#!/bin/bash
 
ip_address=$(curl -s ifconfig.io)
tmp_file="/tmp/global_ip_address_notifier"
if ! [ -e ${tmp_file} ]; then
  touch ${tmp_file}
fi
past_ip_address=$(cat ${tmp_file})
 
if [ "${ip_address}" != "${past_ip_address}" ]; then
  echo ${ip_address} | tee ${tmp_file}
fi
