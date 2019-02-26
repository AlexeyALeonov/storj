#!/usr/bin/env sh
if [ -z "$satellite_address" ]; then
    satellite_address="satellite:7778"
fi
identity create storagenode --difficulty 0
storagenode setup --log.caller --log.development --log.stack --log.level debug \
        --metrics.app-suffix "-test" \
        --kademlia.external-address $(hostname):7777 \
        --kademlia.bootstrap-addr $satellite_address \
        --kademlia.operator.email user@example.com \
        --kademlia.operator.wallet 0x8D7a2e3C16d029F838d1F6327449fd46B5daf881
storagenode run
