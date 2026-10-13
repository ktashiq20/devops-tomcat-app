FROM tomcat:9.0-jdk17
RUN groupadd -r -g 10001 tomcat && useradd -r -u 10001 -g tomcat tomcat \
    && chown -R tomcat:tomcat /usr/local/tomcat
COPY --chown=tomcat:tomcat conf/ump.xml /usr/local/tomcat/conf/ump.xml
USER 10001
EXPOSE 8080
