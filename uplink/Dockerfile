FROM storj:latest
ARG satellite_address=satellite
ARG api_key=abc123
RUN uplink setup --api-key $api_key --satellite-addr $satellite_address:7778 \
	--log.caller --log.development --log.stack --log.level debug
ENTRYPOINT ["uplink"]
