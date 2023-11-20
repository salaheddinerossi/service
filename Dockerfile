FROM ubuntu:latest
LABEL authors="salah"

ENTRYPOINT ["top", "-b"]

# Start with a base image containing Java runtime
FROM openjdk:19-jdk-alpine

# Add Maintainer Info
LABEL maintainer="salaheddine.rossi@etu.uae.ac.ma"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8081

# The application's jar file
ARG JAR_FILE=target/testService-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} testService-0.0.1-SNAPSHOT.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/testService-0.0.1-SNAPSHOT.jar"]
