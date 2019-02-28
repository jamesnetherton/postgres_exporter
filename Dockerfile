FROM alpine

RUN apk add curl --no-cache

COPY ./scrape.sh /scrape.sh

ENTRYPOINT [ "/bin/sh", "/scrape.sh" ]
