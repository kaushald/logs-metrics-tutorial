# First stage: Build the Spring Boot app using the Gradle wrapper
FROM gradle:7.6.1-jdk17 AS build

# Set the working directory
WORKDIR /app

# Copy the source code and build the app
COPY . .

RUN ./gradlew clean build --no-daemon

FROM openjdk:8-jdk-alpine

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the first stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port on which the app is running
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
