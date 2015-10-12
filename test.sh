#!/bin/bash
HOME=$PWD
if ! [ -e hd ]; then
  echo $HOME
  echo export PATH=$PATH:$HADOOP_HOME/bin
fi

if [ -e hd.sh ]; then
  echo "hi"
fi

if [ "$1" == "master" ] || [ "$1" == "Master" ] ; then
  echo "parameter 1 is $1"
  ./test2.sh $1
fi
