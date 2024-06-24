#!/bin/bash

# Define constant
IP_FILE="/tmp/global_ip_address_notifier"

# Get the current IP address
ip_address=$(curl -s ifconfig.io)

# Read the past IP address (return an empty string if the file does not exist)
past_ip_address=$(cat ${IP_FILE} 2>/dev/null || echo "")

# If the IP address has changed, write the new IP address to the file
if [ "${ip_address}" != "${past_ip_address}" ]; then
  echo ${ip_address} | tee ${IP_FILE}
fi
