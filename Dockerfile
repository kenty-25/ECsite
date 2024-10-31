# Build stage
FROM gradle:7.6.0-jdk17 AS build
WORKDIR /app
COPY . /app
RUN gradle clean build -x test

# Package stage
FROM eclipse-temurin:17-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
