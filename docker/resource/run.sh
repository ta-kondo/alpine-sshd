#!/bin/bash -x
# ------------------------------------------------
# -- run.sh
# ------------------------------------------------

# アクセス用ユーザー追加
addgroup -S -g 1001 sshuser
adduser -s /bin/bash -u 1000 -G sshuser -D sshuser
# パスワードがないとsshできない。なぜ？
echo "sshuser:$(openssl rand -hex 12)" | chpasswd

# sshd設定
export PORT=${PORT:-22}
envsubst < /root/resource/sshd.conf.template > /etc/ssh/sshd_config

# sshd用秘密鍵
mv /root/resource/keys/ssh_host_rsa_key      /etc/ssh/ssh_host_rsa_key
mv /root/resource/keys/ssh_host_ecdsa_key    /etc/ssh/ssh_host_ecdsa_key
mv /root/resource/keys/ssh_host_ed25519_key  /etc/ssh/ssh_host_ed25519_key
chmod 0600 /etc/ssh/ssh_host_*_key

# アクセス用公開鍵
mkdir /home/sshuser/.ssh/
mv /root/resource/keys/login_key.pub /home/sshuser/.ssh/authorized_keys

# 鍵置き場は権限を正確に設定する
chown -R sshuser:sshuser /home/sshuser/.ssh/
chmod -R 0600 /home/sshuser/.ssh/
chmod    0700 /home/sshuser/.ssh/

# sshd起動
exec /usr/sbin/sshd -De
