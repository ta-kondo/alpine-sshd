# ------------------------------------------------
# -- sshd
# ------------------------------------------------
FROM alpine:3.16

COPY ./resource /root/resource/

RUN apk update; \
    apk upgrade; \
    apk --no-cache add \
        tzdata \
        bash \
        ca-certificates \
        openssh \
        openssl \
        gettext; \
    # 日本時間
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime; \
    # シェルには実行権限
    chmod u+x /root/resource/run.sh; \
    # 後片付け
    apk del tzdata; \
    rm -rf /var/cache/apk/*

CMD /root/resource/run.sh
