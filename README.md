# README

# アプリケーション名
## このアプリケーション概要 登録しておいた店のタイムセールの時間がわかる
## デプロイ済みURL
## テスト用アカウント

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
### Association
- has_many :sales

## salesテーブル
|Column|Type|Options|
|------|----|-------|
|day|date|null:false|
|start_hour|integer|null:false|
|start_min|integer|null:false|
|end_hour|integer|null:false|
|end_min|integer|null:false|
|
### association
- has_many :users




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
