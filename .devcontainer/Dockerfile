# .devcontainer/Dockerfile
FROM cirrusci/flutter:latest

# 必要なら追加ツールをインストール
RUN apt-get update && apt-get install -y \
    git curl unzip xz-utils zip libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /workspace