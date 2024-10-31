

FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM eclipse-temurin:17-alpine
COPY --from=build /target/ecsite-main-1.0.jar ecsite-main.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ecsite-main"]
