FROM gliderlabs/alpine
MAINTAINER kost - https://github.com/kost

RUN apk --update add openssl && rm -f /var/cache/apk/* 
ADD /scripts /bloom
RUN wget https://github.com/kost/libsimplebloom/raw/master/bin/bloomutil-static-i586 -O /bin/bloomutil && chmod 755 /bin/bloomutil && chmod 755 /bloom/* && mkdir /work && /bloom/preparedb.sh && rm -rf /lib /var /usr /media /mnt /run /sbin || echo "Ignore this"

VOLUME /work
WORKDIR /work

ENTRYPOINT ["/bin/bloomutil"]

CMD ["-h"]
