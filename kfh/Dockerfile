FROM gliderlabs/alpine
MAINTAINER kost - https://github.com/kost

ADD /scripts /work/
RUN adduser -D -s /bin/sh user user && chown -R user /work && chmod 755 /work/*
RUN apk --update add openssl && rm -f /var/cache/apk/* && \
wget https://github.com/kost/libsimplebloom/raw/master/bin/bloomutil-static-i586 -O /usr/local/bin/bloomutil && chmod 755 /usr/local/bin/bloomutil 
# RUN wget https://github.com/kost/libsimplebloom/raw/master/bin/bloomutil-static-x64 -O /usr/local/bin/bloomutil && chmod 755 /usr/local/bin/bloomutil

USER user
RUN /work/preparedb.sh 

VOLUME /work
WORKDIR /work

ENTRYPOINT ["bloomutil"]

CMD ["-h"]
