#!/bin/bash

# Script for removing X-PACK from kibana & running it
rm -rf ./plugins/x-pack

xpack_string=xpack.security.enabled
config_file=./config/kibana.yml

sed -i 's/elasticsearch.*/#/g' "$config_file"
sed -i 's/xpack.*/#/g' "$config_file"

if grep -q "$xpack_string" "$config_file"
then
  sed -i "s/$xpack_string: true/$xpack_string: false/g" "$config_file"
else
  echo "$xpack_string: false" >> "$config_file"
fi

kibana-docker
