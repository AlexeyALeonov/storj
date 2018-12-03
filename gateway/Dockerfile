FROM storj:latest
ARG satellite_address=satellite
ARG gateway_address=gateway
ARG api_key=abc123
RUN gateway setup --api-key $api_key --satellite-addr $satellite_address:7778 \
    --enc-key highlydistributedridiculouslyresilient \
	--log.caller --log.development --log.stack --log.level debug
CMD ["gateway","run"]
