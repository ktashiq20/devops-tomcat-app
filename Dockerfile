FROM tomcat:9.0-jdk17
COPY conf/ump.xml /usr/local/tomcat/conf/ump.xml
EXPOSE 8080
