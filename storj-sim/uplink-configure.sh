#!/bin/bash

identity create uplink --difficulty 0 --metrics.app-suffix "-test"
mkdir /root/.local/share/storj/uplink/
cp /root/.local/share/storj/local-network/gateway/0/config.yaml /root/.local/share/storj/uplink/config.yaml
sed -i '/minio:/,/monkit:/{/monkit:/!d}' /root/.local/share/storj/uplink/config.yaml
sed -i '/server:/,/tls:/{/tls:/!d}' /root/.local/share/storj/uplink/config.yaml
