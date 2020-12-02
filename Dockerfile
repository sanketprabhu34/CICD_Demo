FROM tomcat:8
COPY target/my-app-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/
