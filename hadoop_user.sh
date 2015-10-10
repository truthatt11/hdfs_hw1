#!/bin/bash
SCRIPT_HOME=$PWD

ssh-keygen -t rsa -P "" -f /home/hadoopuser/.ssh/id_rsa

cat /home/hadoopuser/.ssh/id_rsa.pub >> /home/hadoopuser/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-copy-id -i ~/.ssh/id_rsa.pub slave
ssh slave
cd ~
wget http://ftp.twaren.net/Unix/Web/apache/hadoop/common/hadoop-2.6.1/hadoop-2.6.1.tar.gz
tar xf hadoop-2.6.1.tar.gz
mv hadoop-2.6.1 hadoop

sed '/<configuration>/r $SCRIPT_HOME/core-site.txt' /home/hadoopuser/hadoop/etc/hadoop/core-site.xml
