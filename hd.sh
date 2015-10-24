#!/bin/bash
echo -e "\n" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer ssh
sudo update-java-alternatives -s java-8-oracle
sudo ./disable_ipv6.sh

content=$(cat ~/.bashrc | grep -f env.txt)
#echo $content
if ! [[ -z "$content" ]]; then
    cat env.txt >> ~/.bashrc 
fi

# Create hadoopgroup
sudo addgroup hadoopgroup
# Create hadoopuser user
sudo adduser -ingroup hadoopgroup hadoopuser --disabled-password --gecos ""

sudo mkdir /hadoop-data
sudo mkdir /hadoop-data/hadoopuser
sudo mkdir /hadoop-data/hadoopuser/hdfs
sudo mkdir /hadoop-data/hadoopuser/hdfs/namenode
sudo mkdir /hadoop-data/hadoopuser/hdfs/datanode

sudo chown -R hadoopuser:hadoopgroup /hadoop-data

echo Running Hadoop Configuration
sudo su hadoopuser -c "./hadoop_user.sh $1"
echo Hadoop configuration done
