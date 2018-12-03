FROM storj:latest
ARG satellite_address=satellite
ARG redis_address=redis
ARG api_key=abc123
RUN satellite setup \
        --metrics.app_suffix "-test" \
		--pointer-db.auth.api-key "$api_key" \
		--log.caller --log.development --log.stack --log.level debug \
    && sed -i s/'address: :7777'/'address: '$satellite_address':7778'/g $HOME/.storj/satellite/config.yaml \
    && sed -i s/'todo-listen-addr: 127.0.0.1:7776'/'todo-listen-addr: '$satellite_address':7779'/g $HOME/.storj/satellite/config.yaml \
    && sed -i s/'bootstrap-dev.storj.io:8080'/$satellite_address':7778'/g $HOME/.storj/satellite/config.yaml \
    && sed -i s/'redis:\/\/127.0.0.1:6378?db=1&password=abc123'/'redis:\/\/'$redis_address':6379?db=1'/g $HOME/.storj/satellite/config.yaml
CMD ["satellite", "run"]
