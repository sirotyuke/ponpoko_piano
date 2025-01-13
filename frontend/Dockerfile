FROM node:20-slim

ENV NEXT_TELEMETRY_DISABLED=1
ENV NPM_CONFIG_CACHE=/app/.npm

WORKDIR /app

# 必要なディレクトリを作成し、権限を設定
RUN mkdir -p /app/node_modules /app/.next /app/.npm && \
    chown -R 1000:1000 /app && \
    chmod -R 755 /app

# package.jsonとpackage-lock.jsonをコピー
COPY --chown=1000:1000 package*.json ./

# 依存関係のインストール
RUN npm install && \
    npm install -g next

# アプリケーションのファイルをコピー
COPY --chown=1000:1000 . .

# 本番用ビルド
RUN npm run build

# スタンドアロンサーバーの準備
RUN cp -r .next/static .next/standalone/.next/static && \
    cp -r public .next/standalone/public && \
    if [ -f .env ]; then cp .env .next/standalone/; fi && \
    if [ -f .env.production ]; then cp .env.production .next/standalone/; fi

USER node

# スタンドアロンディレクトリに移動
WORKDIR /app/.next/standalone

EXPOSE 3000

# 本番環境用のコマンド
CMD ["node", "server.js"]
