#!/bin/ash

if [[ -n "${PROTOCOL}" ]]; then
  PROTOCOL="--protocol=${PROTOCOL}"
fi

if [[ -n "${CERTIFICATE}" ]]; then
  CERTIFICATE="--certificate=${CERTIFICATE}"
fi

echo ${PASSWORD} | openconnect --user ${USER} --passwd-on-stdin ${PROTOCOL} ${CERTIFICATE} -- ${HOST}
