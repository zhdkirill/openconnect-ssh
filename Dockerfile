FROM alpine:edge
LABEL maintainer="kirill@kzhdanov.com"
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add openconnect openssh-server
COPY sshd.conf /etc/ssh/sshd_config
COPY entrypoint.sh /
EXPOSE 22/tcp
ENTRYPOINT ["/entrypoint.sh"]
