FROM tomcat:7-jre7
MAINTAINER "Craig Trim <craigtrim@gmail.com>"
ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf/

# 容器需要开放Tomcat 8080端口
EXPOSE 80
ENTRYPOINT service tomcat7 start && /usr/sbin/sshd -D