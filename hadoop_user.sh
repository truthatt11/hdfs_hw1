#!/bin/bash
SCRIPT_HOME=${PWD}
TARGET_HOME=/home/hadoopuser/hadoop/etc/hadoop

#echo $SCRIPT_HOME
#echo $TARGET_HOME

if ! [ -f /home/hadoopuser/.ssh/id_rsa ] ; then
  if [ "$1" == "master" ] || [ "$1" == "Master" ] ; then
    ssh-keygen -t rsa -P "" -f /home/hadoopuser/.ssh/id_rsa
    cat /home/hadoopuser/.ssh/id_rsa.pub > /home/hadoopuser/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ssh-copy-id -i ~/.ssh/id_rsa.pub slave
    ssh slave
  fi
fi
cat env.txt >> ~/.bashrc

cd ~
if ! [ -d hadoop ]; then
    wget http://ftp.twaren.net/Unix/Web/apache/hadoop/common/hadoop-2.6.1/hadoop-2.6.1.tar.gz
    tar xf hadoop-2.6.1.tar.gz
    mv hadoop-2.6.1 hadoop
fi

mv $TARGET_HOME/core-site.xml $TARGET_HOME/core-site.xml.backup
sed "/<configuration>/r $SCRIPT_HOME/core-site.txt" $TARGET_HOME/core-site.xml.backup > $TARGET_HOME/core-site.xml
# for master node only
if [ "$1" == "master" ] || [ "$1" == "Master" ]; then
    sed "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" $TARGET_HOME/mapred-site.xml.template > $TARGET_HOME/mapred-site.xml
fi
# end here
mv $TARGET_HOME/hdfs-site.xml $TARGET_HOME/hdfs-site.xml.backup
mv $TARGET_HOME/yarn-site.xml $TARGET_HOME/yarn-site.xml.backup
sed "/<configuration>/r $SCRIPT_HOME/hdfs-site.txt" $TARGET_HOME/hdfs-site.xml.backup > $TARGET_HOME/hdfs-site.xml
sed "/YARN configuration properties/r $SCRIPT_HOME/yarn-site.txt" $TARGET_HOME/yarn-site.xml.backup > $TARGET_HOME/yarn-site.xml

# for master node only
if [ "$1" == "master" ] || [ "$1" == "Master" ]; then
    echo $SCRIPT_HOME/slaves > $TARGET_HOME/slaves
    hdfs namenode -format
    ./home/hadoopuser/hadoop/sbin/start-dfs.sh
fi
# end

/home/hadoopuser/hadoop/sbin/start-yarn.sh
jps
