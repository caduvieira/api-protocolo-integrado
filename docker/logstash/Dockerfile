FROM docker.elastic.co/logstash/logstash-oss:6.2.4

ADD ./logstash.conf /logstash.conf
COPY ./mysql-connector-java-5.1.46-bin.jar /mysql-connector-java-5.1.46-bin.jar
EXPOSE 5000
CMD logstash -f /logstash.conf
