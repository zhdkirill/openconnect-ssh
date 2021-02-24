#!/bin/ash

ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -t ed25519
echo "${SSH_KEYS}" > /etc/ssh/authorized_keys
adduser -S ${SSH_USER}
passwd -u ${SSH_USER}
/usr/sbin/sshd

if [[ -n "${PROTOCOL}" ]]; then
  PROTOCOL="--protocol=${PROTOCOL}"
fi

if [[ -n "${CERTIFICATE}" ]]; then
  CERTIFICATE="--certificate=${CERTIFICATE}"
fi

echo ${PASSWORD} | openconnect --user ${USER} --passwd-on-stdin ${PROTOCOL} ${CERTIFICATE} -- ${HOST}
