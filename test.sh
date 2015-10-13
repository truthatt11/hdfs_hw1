#!/bin/bash
SCRIPT_HOME=${PWD}
TARGET_HOME=/home/hadoopuser/hadoop/etc/hadoop

#cp $TARGET_HOME/mapred-site.xml mapred-site.xml
#sed "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" $TARGET_HOME/mapred-site.xml.template > mapred-site.xml
#sed "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" $TARGET_HOME/mapred-site.xml.template > $TARGET_HOME/mapred-site.xml
#sed -i "/<configuration>/r $SCRIPT_HOME/mapred-site.txt" mapred-site.xml
#sed 's/JAVA_HOME=${JAVA_HOME}/JAVA_HOME=\"\/usr\/lib\/jvm\/java-8-oracle\"/' a.txt > b.txt

content=$(cat ~/.bashrc | grep -f env.txt)
echo "$content"
if [[ -z "$content" ]]; then
    cat env.txt >> ~/.bashrc 
fi

