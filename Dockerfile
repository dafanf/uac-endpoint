# Stage 1: Build the application
FROM maven:3.9.4-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: Create the runtime image
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/kelompok-a6-0.0.0-A.jar /app/app.jar

EXPOSE 8091
CMD ["java", "-jar", "app.jar"]