FROM openjdk:8

#RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/ambry/target && \
mkdir -p /opt/ambry/config && \
mkdir -p /opt/ambry/target/logs && \
mkdir -p /opt/ambry/data

COPY target/* /opt/ambry/target/
COPY config/coppernicconfig/* /opt/ambry/config/
COPY docker/* /opt/ambry

EXPOSE 1174
EXPOSE 1175

WORKDIR /opt/ambry

CMD ["bash", "entry_point.sh"]
