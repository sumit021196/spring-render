FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/lifecare-0.0.1-SNAPSHOP.jar lifecare.jar
EXPOSE 8080
ENTRYPOINT [ "java","lifecare.jar" ]