FROM storj:latest
ARG satellite_address=satellite
ARG satellite_port=7778
ARG api_key=abc123
EXPOSE ${satellite_port}
RUN identity create satellite --metrics.app-suffix "-test" --difficulty 0
RUN satellite setup --log.caller --log.development --log.stack --log.level debug \
    --metrics.app-suffix "-test" \
    --kademlia.bootstrap-addr "${satellite_address}:${satellite_port}" \
    --server.address "${satellite_address}:${satellite_port}" \
    --repairer.api-key "${api_key}" \
    --pointer-db.auth.api-key "${api_key}"
CMD ["satellite", "run"]
