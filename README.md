# gtfs-cli

GTFS を PostGIS にインポートするためのツールです。

## 必要なもの

- Docker
- Docker Compose
- Python 3

## 準備

```shell
$ make init
```

## 環境変数の設定

下記を `.env` に記述します

```shell
POSTGRES_PASSWORD=(DB のパスワード)
PGADMIN_DEFAULT_EMAIL=(pgAdmin のアカウント用メールアドレス)
PGADMIN_DEFAULT_PASSWORD=(pgAdmin のパスワード)
```

## DB を起動

```shell
$ make up
```

http://localhost:8080 で pgAdmin にアクセスできるので上記で設定したアカウントでログインし、DB サーバを下記の設定で登録します。

| 設定項目   | 値                               |
|------------|----------------------------------|
| 名前       | (任意)                           |
| ホスト     | postgres                         |
| ユーザ名   | postgres                         |
| パスワード | (上記で設定した DB のパスワード) |

## GTFS をインポート

```shell
$ make import DATABASE_URL=postgres://postgres:(DB のパスワード)@localhost:5432/postgres GTFS=(GTFS zip への絶対パス)
```
