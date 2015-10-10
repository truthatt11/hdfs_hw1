echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf

echo '172.31.29.177 slave' >> /etc/hosts
echo '172.31.29.176 master' >> /etc/hosts
