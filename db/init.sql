-- データベースが存在しない場合は作成
CREATE DATABASE IF NOT EXISTS ponpoko_piano;
USE ponpoko_piano;

-- ユーザーの作成と権限付与（全てのIPからのアクセスを許可）
CREATE USER IF NOT EXISTS 'ponpoko'@'%' IDENTIFIED BY 'ponpoko123';
GRANT ALL PRIVILEGES ON ponpoko_piano.* TO 'ponpoko'@'%';

-- rootユーザーのリモートアクセスを許可
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root123';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

-- 権限の反映
FLUSH PRIVILEGES;

-- 必要なテーブルの作成はここに追加 