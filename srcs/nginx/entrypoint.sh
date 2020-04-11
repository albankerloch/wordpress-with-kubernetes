#!/bin/sh

mkdir .ssh
mv /authorized_keys .ssh/authorized_keys
chmod 600 /etc/ssh/ssh_host_rsa_key
chmod 700 .ssh
chmod 644 .ssh/authorized_keys

adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
echo "user:password = $SSH_USER:$SSH_PASSWORD"

/usr/sbin/sshd

/usr/sbin/nginx -g 'daemon off;'
