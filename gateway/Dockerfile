FROM storj:latest
ARG satellite_address=satellite
ARG satellite_port=7778
ARG gateway_address=gateway
ARG gateway_port=7777
ARG api_key=abc123
ARG enc_key=highlydistributedridiculouslyresilient
EXPOSE ${gateway_port}
RUN identity create gateway --difficulty 0 --metrics.app-suffix "-test"
RUN gateway setup --api-key ${api_key} --satellite-addr ${satellite_address}:${satellite_port} \
	--log.caller --log.development --log.stack --log.level debug \
    --metrics.app-suffix "-test" \
    --enc.key ${enc_key} \
	--rs.max-threshold 9 \
	--rs.min-threshold 3 \
	--rs.repair-threshold 5 \
	--rs.success-threshold 8
CMD ["gateway","run"]
