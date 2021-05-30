FROM tomcat:jdk11
RUN apt-get update
RUN apt-get install maven -y
COPY ./myapp/ /usr/app/
WORKDIR /usr/app/
RUN mvn package
RUN cp ./target/hello-1.0.war /usr/local/tomcat/webapps/