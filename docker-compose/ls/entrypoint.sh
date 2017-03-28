#!/bin/bash

# Script for removing X-PACK from logstash & running it
xpack_string=xpack.monitoring.enabled
config_file="$LS_PATH/config/logstash.yml"

if grep -q "$xpack_string" "$config_file"
then
  sed -i "s/$xpack_string: true/$xpack_string: false/g" "$config_file"
else
  echo "$xpack_string: false" >> "$config_file"
fi

logstash -f $LS_PATH/pipeline/
