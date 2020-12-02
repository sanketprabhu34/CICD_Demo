FROM tomcat:8
COPY target/mywebapp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/
