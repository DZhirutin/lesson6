#image ubuntu
FROM ubuntu:20.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install default-jdk wget
RUN apt-get install maven -y
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.46/* /usr/local/tomcat/
COPY ./myapp/ /usr/app/
WORKDIR /usr/app/
RUN mvn package
RUN cp ./target/hello-1.0.war /usr/local/tomcat/webapps/
CMD /usr/local/tomcat/bin/catalina.sh run