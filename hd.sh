sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer ssh
sudo update-java-alternatives -s java-8-oracle
sudo ./disable_ipv6.sh

# Set HADOOP_HOME
export HADOOP_HOME=/home/hadoopuser/hadoop
# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# Add Hadoop bin and sbin directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin;$HADOOP_HOME/sbin

# Create hadoopgroup
sudo addgroup hadoopgroup
# Create hadoopuser user
sudo adduser -ingroup hadoopgroup hadoopuser --disabled-password --gecos ""
sudo su hadoopuser -c ./hadoop_user.sh



