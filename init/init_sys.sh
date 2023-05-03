systemctl stop firewalld
systemctl disable firewalld
cat > /etc/security/limits.conf <<EOF
soft nofile 204800
hard nofile 204800
soft nproc 204800
hard nproc 204800
EOF
echo 8192 > /proc/sys/net/core/somaxconn

cat > /etc/yum.repos.d/proxysql.repo << EOF
[proxysql]
name=ProxySQL YUM repository
baseurl=https://repo.proxysql.com/ProxySQL/proxysql-2.4.x/centos/\$releasever
gpgcheck=1
gpgkey=https://repo.proxysql.com/ProxySQL/proxysql-2.4.x/repo_pub_key
EOF
# yum install proxysql OR yum install proxysql-version
function limits_update(){
cat >/etc/security/limits.conf<<EOF
* soft    nofile  1024000
* hard    nofile  1024000
* soft    nproc   unlimited
* hard    nproc   unlimited
* soft    core    unlimited
* hard    core    unlimited
* soft    memlock unlimited
* hard    memlock unlimited
EOF
}

