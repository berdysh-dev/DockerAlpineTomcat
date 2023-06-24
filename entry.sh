#! /bin/sh

export LANG=C
export TZ=JST-9

export JAVA_HOME=/usr/lib/jvm/default-jvm
export JRE_HOME=/usr/lib/jvm/default-jvm

export TOMCAT_HOME=/usr/local/tomcat
export CATALINA_HOME=/usr/local/tomcat

env

/usr/local/tomcat/bin/startup.sh

while test true
do
    date
    sleep 60
done


