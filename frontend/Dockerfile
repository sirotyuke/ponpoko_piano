FROM node:20-slim

ENV NEXT_TELEMETRY_DISABLED=1
ENV NPM_CONFIG_CACHE=/app/.npm

# 開発環境用の設定
# ENV NODE_ENV=development

WORKDIR /app

# 必要なディレクトリを作成し、権限を設定
RUN mkdir -p /app/node_modules /app/.next /app/.npm && \
    chown -R 1000:1000 /app && \
    chmod -R 755 /app

# package.jsonとpackage-lock.jsonをコピー
COPY --chown=1000:1000 package*.json ./

# 依存関係のインストール
RUN npm install

# アプリケーションのファイルをコピー
COPY --chown=1000:1000 . .

# 開発環境用の権限設定
# RUN chmod 644 package*.json && \
#     chmod -R 755 node_modules .next .npm

USER node

EXPOSE 3000
# 開発環境用のデバッグポート
# EXPOSE 9229

# 開発環境用のコマンド
# CMD ["npm", "run", "dev"]

# 本番環境用のコマンド
CMD ["npm", "run", "start"]
