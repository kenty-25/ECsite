# ステージ1: ビルド
FROM maven:3-eclipse-temurin-17 AS build
# Mavenの3.xとEclipse Temurin 17（OpenJDK 17に基づく）を使い、ビルドステージを開始します。

# 作業ディレクトリを設定
WORKDIR /app

# 必要なファイルを正確にコピー
COPY pom.xml /app/
# 最初にpom.xmlをコピーすることで、Mavenの依存関係をキャッシュできます。

# 依存関係のダウンロードとキャッシュ
RUN mvn dependency:go-offline -B

# 残りのソースコードをコピー
COPY . /app
# プロジェクトのすべてのファイルを/appディレクトリにコピーします。

# ビルド実行
RUN mvn clean package -Dmaven.test.skip=true
# Mavenの`clean package`コマンドを実行して、アプリケーションをビルドします。
# `-Dmaven.test.skip=true`オプションでテストをスキップし、ビルド時間を短縮します。

# ステージ2: 実行
FROM eclipse-temurin:17-alpine
# 軽量なEclipse Temurin 17（OpenJDK 17）Alpineイメージを使用して、新しいステージを開始します。

# 作業ディレクトリを設定
WORKDIR /app

# ビルドステージから生成されたJARファイルをコピー
COPY --from=build /app/target/ecsite-main-1.0.jar ecsite-main.jar
# ビルドステージ（`build`）から生成されたJARファイル（`ecsite-main-1.0.jar`）をコピーし、実行環境に配置します。

# ポートを公開
EXPOSE 8080

# アプリケーションの起動
ENTRYPOINT ["java", "-jar", "ecsite-main.jar"]
