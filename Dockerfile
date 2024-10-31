FROM maven:3-eclipse-temurin-17 AS build
WORKDIR /app
COPY . /app
RUN ls -al /app  # デバッグ用：ファイルが適切にコピーされたか確認
RUN mvn clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-alpine
WORKDIR /app
COPY --from=build /app/target/ecsite-main-1.0.jar ecsite-main.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ecsite-main.jar"]
