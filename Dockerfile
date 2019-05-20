FROM alpine:3.8

LABEL maintainer "step21 <step21@devtal.de>"
LABEL version "1.1"

ENV TZ "Europe/Berlin"

RUN apk add --update --no-cache tzdata net-snmp-tools mrtg dcron nginx python3 && mkdir -p /etc/mrtg/conf.d

ADD files/mrtg.sh /usr/sbin/mrtg.sh
ADD files/mrtg.cron /etc/crontabs/root
ADD files/nginx.conf /etc/nginx/nginx.conf
ADD files/mrtg.cfg /etc/mrtg/mrtg.cfg
RUN cd /tmp && wget https://github.com/MStrecke/ng-upnp2mrtg/archive/master.zip && unzip /tmp/master.zip
RUN cp /tmp/ng-upnp2mrtg-master/ng-upnp2mrtg3.py /usr/local/bin
RUN rm -Rf /tmp/ng-upnp2mrtg-master

CMD ["/usr/sbin/mrtg.sh"]

LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="fritz-MRTG" \
          org.label-schema.description="Multi Router Traffic Grapher for FritzBox." \
          org.label-schema.url="https://www.devtal.de/~step21/" \
          org.label-schema.vcs-url=https://www.github.com/step21/fritz-mrtg \
          org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vendor="$VENDOR" \
          org.label-schema.version="$VERSION" \
          org.label-schema.schema-version="1.0" \
          org.label-schema.author="$AUTHOR" \
          org.label-schema.docker.dockerfile="/Dockerfile" \
          org.label-schema.license="MIT"
