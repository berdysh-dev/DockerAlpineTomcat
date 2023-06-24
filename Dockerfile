FROM alpine:latest

RUN adduser -u 1200 mysql ; exit 0
RUN adduser -u 1201 postgres ; exit 0
RUN adduser -u 1202 redis ; exit 0
RUN adduser -u 1203 sshd ; exit 0
RUN adduser -u 1204 nginx ; exit 0
RUN adduser -u 1205 apache ; exit 0
RUN adduser -u 1206 tomcat ; exit 0

RUN apk update

# RUN apk add openjdk11 openjdk11-demos openjdk11-doc openjdk11-jdk openjdk11-jmods openjdk11-jre openjdk11-jre-headless
RUN apk add openjdk17 openjdk17-demos openjdk17-doc openjdk17-jdk openjdk17-jmods openjdk17-jre openjdk17-jre-headless

RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.10/bin/apache-tomcat-10.1.10.tar.gz -O /usr/local/apache-tomcat.tar.gz 
RUN cd /usr/local ; tar xzf /usr/local/apache-tomcat.tar.gz ; ln -s /usr/local/apache-tomcat-10.1.10 /usr/local/tomcat

COPY server.xml /usr/local/tomcat/conf/server.xml
COPY web.xml    /usr/local/tomcat/conf/web.xml
COPY setenv.sh  /usr/local/tomcat/bin/setenv.sh
COPY entry.sh   /usr/local/bin/entry.sh

CMD ["sh","/usr/local/bin/entry.sh"]




