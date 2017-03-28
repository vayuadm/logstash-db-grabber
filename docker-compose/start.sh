#!/bin/bash

# Check if virtual memory is too low
vm=`sysctl vm.max_map_count`
vm_req_value=262144

if [ "${vm//[!0-9]/}" -ne "$vm_req_value" ]
then
  echo "Not enough virtual memory"
  sudo sysctl -w vm.max_map_count="$vm_req_value"
fi

# Load variables from config file
config_file=./ceribro.config

if [ -f "$config_file" ]
then
  set -o allexport
  source "$config_file"
  set +o allexport
else
  echo "Configuration file 'ceribro.config' not found!"
  exit -1
fi

# Start docker environment
docker-compose up
