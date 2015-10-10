#!/bin/bash
SCRIPT_HOME=$PWD
TARGET_HOME=/home/hadoopuser/

ssh-keygen -t rsa -P "" -f /home/hadoopuser/.ssh/id_rsa

cat /home/hadoopuser/.ssh/id_rsa.pub >> /home/hadoopuser/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-copy-id -i ~/.ssh/id_rsa.pub slave
ssh slave
echo env.txt >> ~/.bashrc

cd ~
wget http://ftp.twaren.net/Unix/Web/apache/hadoop/common/hadoop-2.6.1/hadoop-2.6.1.tar.gz
tar xf hadoop-2.6.1.tar.gz
mv hadoop-2.6.1 hadoop

sed '/<configuration>/r $SCRIPT_HOME/core-site.txt' $TARGET_HOME/hadoop/etc/hadoop/core-site.xml > $TARGET_HOME/hadoop/etc/hadoop/core-site.xml
# for master node only
sed '/<configuration>/r $SCRIPT_HOME/mapred-site.txt' $TARGET_HOME/hadoop/etc/hadoop/mapred-site.xml.template > $TARGET_HOME/hadoop/etc/hadoop/mapred-site.xml
# end here
sed '/<configuration>/r $SCRIPT_HOME/hdfs-site.txt' $TARGET_HOME/hadoop/etc/hadoop/hdfs-site.xml > $TARGET_HOME/hadoop/etc/hadoop/hdfs-site.xml
sed '/YARN configuration properties/r $SCRIPT_HOME/yarn-site.txt' $TARGET_HOME/hadoop/etc/hadoop/yarn-site.xml > $TARGET_HOME/hadoop/etc/hadoop/yarn-site.xml

# for master node only
echo $SCRIPT_HOME/slaves > $TARGET_HOME/hadoop/etc/hadoop/slaves

# end
