echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf

echo '192.168.160.130 slave' >> /etc/hosts
echo '192.168.160.131 master' >> /etc/hosts
