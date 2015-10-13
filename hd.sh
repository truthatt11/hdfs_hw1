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
echo Running Hadoop Configuration
sudo su hadoopuser -c "./hadoop_user.sh $1"
echo Hadoop configuration done
