# Stage 1: Build the application
FROM maven:3.9.2-jdk-19 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# Stage 2: Create the final Docker image
FROM openjdk:19-jdk-slim
COPY --from=build /home/app/target/testService-0.0.1-SNAPSHOT.jar /usr/local/lib/testService.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/testService.jar"]
