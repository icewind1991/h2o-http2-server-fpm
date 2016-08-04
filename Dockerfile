FROM lkwg82/h2o-http2-server

ENV CONFD_VERSION=0.11.0

# Statically build confd for Alpine Linux :)
RUN apk add --no-cache go git gcc musl-dev && \
    git clone https://github.com/kelseyhightower/confd.git /src/confd && \
    cd /src/confd && \
    git checkout -q --detach "v$CONFD_VERSION" && \
    cd /src/confd/src/github.com/kelseyhightower/confd && \
    GOPATH=/src/confd/vendor:/src/confd go build -a -installsuffix cgo -ldflags '-extld ld -extldflags -static' -x . && \
    mv ./confd /bin/ && \
    chmod +x /bin/confd && \
    apk del go git gcc musl-dev && \
    rm -rf /src

RUN mkdir -p /etc/confd/conf.d /etc/confd/templates

ENV FPM_PORT 9000
ENV FPM_HOST localhost
ADD h2o.conf /etc/confd/templates
ADD h2o.conf.toml /etc/confd/conf.d
ADD h2o.sh /

CMD /h2o.sh
