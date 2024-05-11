# README

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



# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false | 
| first_name         | string   | null: false | 
| last_name_kana     | string   | null: false | 
| first_name_kana    | string   | null: false | 
| birthday_year      | date     | null: false | 
| birthday_manth     | date     | null: false | 
| birthday_date      | date     | null: false | 


### Association

- has_many :items
- has_many :orders_addresses


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| category           | string     | null: false                    | カテゴリ
| title              | string     | null: false                    | 商品名
| title_description  | text       | null: false                    | 商品説明
| condition          | string     | null: false                    | 商品状態
| shipp_fee          | string     | null: false                    | 配送料負担
| shipp_origin       | string     | null: false                    | 配送元地域
| shipp_date         | string     | null: false                    | 発送日の目安
| price              | integer    | null: false                    | 価格
| commission_fee     | integer    | null: false                    | 手数料
| profit             | integer    | null: false                    | 利益
| user               | references | null: false, foreign_key: true |  
| order              | references | null: false, foreign_key: true | 


### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |  
| item       | references | null: false, foreign_key: true | 


### Association

- belongs_to :item
- belongs_to :orders_addresses


## orders_addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | text       | null: false                    |
| block      | string     | null: false                    |
| building   | string     | null: false                    |
| phone      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| order      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :order

