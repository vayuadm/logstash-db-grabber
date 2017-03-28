#!/bin/bash

rm -rf plugins/x-pack

sed -i 's/xpack.security.enabled: true/xpack.security.enabled: false/g' ./config/elasticsearch.yml
/bin/bash bin/es-docker
