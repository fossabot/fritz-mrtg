#!/bin/sh -e

MRTGDIR=/etc/mrtg
WEBDIR=/usr/share/nginx/html
MRTGCFG=${MRTGDIR}/mrtg.cfg

[[ ! -d "${MRTGDIR}" ]] && mkdir -p ${MRTGDIR}
[[ ! -d "${WEBDIR}" ]] && mkdir -p ${WEBDIR}

env LANG=C /usr/bin/mrtg ${MRTGCFG}
/usr/bin/indexmaker --columns=1 ${MRTGCFG} > ${WEBDIR}/index.html
chown -R nginx:nginx ${WEBDIR}

/usr/sbin/nginx &
NGINXID=$!

/usr/sbin/crond -f -L /proc/self/fd/1 -l debug &
CRONDID=$!

trap "kill ${NGINXID} ${CRONDID}" SIGINT SIGHUP SIGTERM SIGQUIT EXIT
wait
