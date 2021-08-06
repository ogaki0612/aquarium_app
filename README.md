# README

## アプリ名
Aquaria

### 概要
アクアリウム（主に観賞魚の水槽）専門の画像投稿アプリ

### 制作背景
アクアリウムに興味のある人の為のアプリを開発したいと思いました。自分のアクアリウムを多くの人に紹介したい、色々なアクアリウムの画像を見たい、知識の共有や交流をしたいという人の希望を叶えるのを目的で制作しました。

### 実装予定の内容
ユーザー登録機能、アクアリウムメイン画像投稿機能、アクアリウムログ画像機能、コメント機能

## DB設計

### usersテーブル

| column             | type    | option       |
| ------------------ | ------- | ------------ |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| nickname           | string  | null: false  |
| profile            | string  | null: false  |

#### Association

-has_many :aquas
-has_many :comments

### aquasテーブル

| column           | type       | option            |
| ---------------- | ---------- | ----------------- |
| title            | string     | null: false       |
| details          | text       | null: false       |
| category_id      | integer    | null: false       |
| user             | references | foreign_key: true |

#### Association

-belongs_to :user
-has_many :logs
-has_many :comments

### logsテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| title         | string     | null: false       |
| text          | text       | null: false       |
| aqua          | references | foreign_key: true |

#### Association

-belongs_to :aqua

### commentsテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| text          | text       | null: false       |
| user          | references | foreign_key: true |
| aqua          | references | foreign_key: true |

#### Association

-belongs_to :user
-belongs_to :aqua

