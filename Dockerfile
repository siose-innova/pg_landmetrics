FROM benizar/postgis-ext


WORKDIR /install-ext
ADD doc doc/
ADD sql sql/
#ADD test test/
ADD Makefile Makefile
ADD META.json META.json
ADD pg_landmetrics.control pg_landmetrics.control

RUN make
RUN make install
#RUN make install && make installcheck

WORKDIR /
RUN rm -rf /install-ext

ADD init-db.sh /docker-entrypoint-initdb.d/init-db.sh
