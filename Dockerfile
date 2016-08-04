FROM lkwg82/h2o-http2-server

ENV FPM_PORT 9000
ENV FPM_HOST localhost
ADD h2o.conf /etc/h2o/
ADD h2o.sh /

CMD /h2o.sh
