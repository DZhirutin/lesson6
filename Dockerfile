FROM tomcat:jdk8-openjdk
COPY ./myapp/target/hello-1.0.war /usr/local/tomcat/webapps
#COPY ./myapp/target/hello-1.0/ /var/lib/tomcat9/webapps/hello-1.0