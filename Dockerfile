FROM alpine:3.7

RUN apk update && \
    apk upgrade && \
    apk add bash nodejs && \
    rm -rf /var/cache/apk/*

RUN npm i -g @sematext/logagent

ENV LOG_URL="http://elasticsearch:9200"
ENV LOG_INDEX=logs
ENV LOG_GLOB="/var/log/**/*.log"

COPY entrypoint.sh /tmp
RUN chmod +x /tmp/entrypoint.sh

WORKDIR /tmp

ENTRYPOINT ["/tmp/entrypoint.sh"]
