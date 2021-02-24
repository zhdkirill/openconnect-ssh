FROM alpine:edge
MAINTAINER Kirill Zhdanov <kirill@kzhdanov.com>
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add openconnect openssh-server && \
    mkdir /root/.ssh
COPY sshd.conf /etc/sshd_config
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
