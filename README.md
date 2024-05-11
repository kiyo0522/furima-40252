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
| birthday　　　      | date     | null: false | 


### Association

- has_many :items
- has_many :orders_addresses


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    | 商品名
| title_description  | text       | null: false                    | 商品説明
| price              | integer    | null: false                    | 価格
| user               | references | null: false, foreign_key: true |  


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
- belongs_to :orders
- belongs_to :orders_addresses


## orders_addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| block      | string     | null: false                    |
| building   | string     | 　　　　　　                     |
| phone      | string     | null: false                    |
| order      | references | null: false, foreign_key: true |


### Association

- has_many   :order

