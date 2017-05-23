FROM alpine

RUN apk --update upgrade && \
    apk --update add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

RUN mkdir /counter

WORKDIR /counter

ADD ./bin/counter_alpine /counter/counter

CMD ["/counter/counter","-addr=:8080"]
