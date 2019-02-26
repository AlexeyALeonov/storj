FROM storj:latest
ARG satellite_address="satellite:7778"
ARG api_key=abc123
ARG enc_key=highlydistributedridiculouslyresilient
RUN identity create uplink --difficulty 0 --metrics.app-suffix "-test"
RUN uplink setup --log.caller --log.development --log.stack --log.level debug \
	--metrics.app-suffix "-test" \
	--satellite-addr "${satellite_address}" \
	--api-key "${api_key}" \
	--enc.key "${enc_key}" \
	--rs.max-threshold 9 \
	--rs.min-threshold 3 \
	--rs.repair-threshold 5 \
	--rs.success-threshold 8
ENTRYPOINT ["uplink"]
