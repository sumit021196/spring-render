FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY target/lifecare-0.0.1-SNAPSHOT.jar lifecare.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","lifecare.jar" ]