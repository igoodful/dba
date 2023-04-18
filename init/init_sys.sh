systemctl stop firewalld
systemctl disable firewalld


cat > /etc/security/limits.conf <<EOF
soft nofile 204800
hard nofile 204800
soft nproc 204800
hard nproc 204800
EOF

echo 8192 > /proc/sys/net/core/somaxconn








