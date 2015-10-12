#!/bin/bash
HOME=$PWD
if ! [ -e hd ]; then
  echo $HOME
  echo export PATH=$PATH:$HADOOP_HOME/bin
fi

if [ -e hd.sh ]; then
  echo "hi"
fi
