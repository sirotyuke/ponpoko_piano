FROM node:20-slim

# 開発環境用の設定
ENV NODE_ENV=development
ENV NEXT_TELEMETRY_DISABLED=1
ENV NPM_CONFIG_CACHE=/app/.npm

WORKDIR /app

# 必要なディレクトリを作成し、権限を設定
RUN mkdir -p /app/node_modules /app/.next /app/.npm && \
    chown -R 1000:1000 /app && \
    chmod -R 755 /app

USER node

EXPOSE 3000
EXPOSE 9229

CMD ["npm", "run", "dev"]
