FROM alpine:3.12

RUN apk update && apk add --no-cache influxdb

COPY loop.sh .

EXPOSE 8086

CMD sh loop.sh