# Ponpoko Piano

## 開発環境のセットアップ

### 必要条件
- Docker
- Docker Compose
- Node.js (v20.x推奨)

### Windows環境でのPowerShell設定
```powershell
# 管理者権限でPowerShellを開き、以下のコマンドを実行
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Node.jsのセットアップ
```bash
# Node.js v20をインストール
nvm install 20
nvm use 20

# PowerShellを再起動してから実行
# npmを最新版に更新
npm install -g npm@latest

# インストールの確認
node -v
npm -v
```

### 初回セットアップ手順

1. リポジトリのクローン
```bash
git clone [repository-url]
cd ponpoko_piano
```

2. データベースボリュームの作成
```bash
# MySQLデータ用の永続ボリュームを作成
docker volume create mysql_data
```

3. フロントエンドの初期化
```bash
# Next.jsプロジェクトの作成
cd frontend

# 方法1: npmを直接使用
npm init next-app . -- --typescript --tailwind --eslint

# もしくは方法2: package.jsonを作成してから必要なパッケージをインストール
npm init -y
npm install next@latest react@latest react-dom@latest typescript@latest @types/react@latest @types/node@latest @types/react-dom@latest tailwindcss@latest eslint@latest

# 依存関係のインストール
npm install

# ルートディレクトリに戻る
cd ..
```

4. アプリケーションの起動
```bash
# キャッシュを完全にクリーン
docker builder prune -f

# 初回起動（ビルド込み）
docker-compose up -d --build
```

### 通常の起動方法
```bash
# アプリケーションの起動
docker-compose up -d
```

### 基本的なコマンド
```bash
# サービスの状態確認
docker-compose ps

# ログの確認
docker-compose logs -f          # 全てのサービス
docker-compose logs -f backend  # 特定のサービス

# サービスの停止
docker-compose down

# サービスの再起動
docker-compose restart [service_name]
```

### アクセス方法
- フロントエンド: http://localhost
- バックエンドAPI: http://localhost/api
- API ドキュメント: http://localhost/api/docs

### 開発用コマンド

```bash
# フロントエンドのシェルにアクセス
docker-compose exec frontend sh

# バックエンドのシェルにアクセス
docker-compose exec backend sh

# データベースへの接続
docker-compose exec db mysql -u user -p ponpoko_piano
```

### トラブルシューティング

ビルドエラーが発生した場合は、以下の手順で完全なリビルドを行ってください：

```bash
# 1. すべてのコンテナとボリュームを削除
docker-compose down -v

# 2. キャッシュを使用せずに再ビルド
docker-compose build --no-cache

# 3. コンテナを起動
docker-compose up -d

# 4. ログを確認（エラーが発生した場合）
docker-compose logs -f
```

よくある問題：
- フロントエンドのビルドエラー → `docker-compose logs -f frontend` で詳細を確認
- バックエンドの接続エラー → `docker-compose logs -f backend` で詳細を確認
- データベース接続エラー → `docker-compose logs -f db` で詳細を確認

### 開発時のコマンド

#### コンテナの再起動（データベースを除く）
```bash
# フロントエンド/バックエンドの変更を適用する場合
docker-compose down
docker-compose up -d --build

# データベースのデータを保持したまま再起動
docker-compose down && docker-compose up -d
```

#### データベースを含めた完全なリセット
```bash
# 全てのコンテナとボリュームを削除（データベースも削除）
docker-compose down -v
```


