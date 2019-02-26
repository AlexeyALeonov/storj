FROM storj:latest
ARG satellite_address="satellite:7778"
EXPOSE 7777
ADD start.sh /storj/
RUN chmod +x /storj/start.sh
CMD [ "/storj/start.sh" ]
