#!/usr/bin/env sh
if [ -z "$satellite_address" ]; then
    satellite_address=satellite
fi
storagenode setup --base-path $HOME/.storj/storagenode --ca.difficulty 0 --metrics.app_suffix "-test" \
        --log.caller --log.development --log.stack --log.level debug
sed -i s/'address: :7777'/'address: '$(hostname)':7777'/g $HOME/.storj/storagenode/config.yaml
sed -i s/'bootstrap-dev.storj.io:8080'/$satellite_address':7778'/g $HOME/.storj/storagenode/config.yaml
storagenode run --config $HOME/.storj/storagenode/config.yaml
