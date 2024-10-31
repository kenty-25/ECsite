# ステージ1: ビルド
FROM maven:3-eclipse-temurin-17 AS build
# Mavenの3.xとEclipse Temurin 17（OpenJDK 17に基づく）を使い、ビルドステージを開始します。

COPY . .
# 現在のディレクトリ（.）のすべてのファイルをコンテナ内にコピーします。

RUN mvn clean package -Dmaven.test.skip=true
# Mavenの`clean package`コマンドを実行して、アプリケーションをビルドします。
# `-Dmaven.test.skip=true`オプションでテストをスキップし、ビルド時間を短縮します。

# ステージ2: 実行
FROM eclipse-temurin:17-alpine
# 軽量なEclipse Temurin 17（OpenJDK 17）Alpineイメージを使用して、新しいステージを開始します。

COPY --from=build /target/ecsite-main.jar ecsite-main.jar
# ビルドステージ（`build`）から生成されたJARファイル（`ecsite-main.jar`）をコピーし、実行環境に配置します。

EXPOSE 8080
# コンテナのポート8080を公開します。このポートを使用して、アプリケーションにアクセスできます。

ENTRYPOINT ["java", "-jar", "ecsite-main.jar"]
# `java -jar ecsite-main.jar`コマンドでアプリケーションを起動します。
# `ecsite-main.jar`は、上記の`COPY`コマンドで指定したファイル名です。
