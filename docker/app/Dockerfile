FROM openjdk:11-jre-slim
ARG JAVA_OPTS

COPY api-protocolo-integrado.jar /app.jar

EXPOSE 8080
CMD java ${JAVA_OPTS} -jar /app.jar
