#!/bin/bash
SCRIPT_HOME=${PWD}
TARGET_HOME=/home/hadoopuser/hadoop/etc/hadoop

cp $TARGET_HOME/mapred-site.xml mapred-site.xml
#sed "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" $TARGET_HOME/mapred-site.xml.template > mapred-site.xml
sed "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" $TARGET_HOME/mapred-site.xml.template > $TARGET_HOME/mapred-site.xml
#sed -i "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" mapred-site.xml

echo $SCRIPT_HOME
echo $TARGET_HOME

if [ "$1" == "master" ] || [ "$1" == "Master" ] ; then
  echo "parameter 1 is $1"
  ./test2.sh $1
fi
