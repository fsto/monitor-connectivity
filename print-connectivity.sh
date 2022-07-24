#!/bin/bash

GATEWAY_IP=$(netstat -nr | grep default | head -n 1 | awk '{print $2}')
declare -a URLS=("kth.se"
                 "google.com"
                 "$GATEWAY_IP"
                 )

for url in "${URLS[@]}"
do
    if [ ! -z "${url}" ]; then
        
        PING=$(/sbin/ping -c 1 -t 5 -q $url 2>&1)
        RETURN_VALUE=$?

        if [ $RETURN_VALUE -ne 0 ]; then
            echo "$(date) ❌ OFFLINE: $url"
        else
            MS=$(echo $PING | tail -n 1 | sed -E 's/.*( ([0-9]+\.[0-9]+)).*/\2/')
            echo "$(date) 🆗 ONLINE: $url ping: $MS ms"
        fi
    fi
done