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
| email              | string   | null: false, unique: true |
| nickname           | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false | 
| first_name         | string   | null: false | 
| last_name_kana     | string   | null: false | 
| first_name_kana    | string   | null: false | 
| birthday　　　      | date     | null: false | 


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    | 商品名
| title_description  | text       | null: false                    | 商品説明
| category_id        | integer    | null: false                    | カテゴリ
| condition_id       | integer    | null: false                    | 商品状態
| shipp_fee_id       | integer    | null: false                    | 配送料負担
| prefecture_id      | integer    | null: false                    | 発送元地域
| shipp_date_id      | integer    | null: false                    | 発送日の目安
| price              | integer    | null: false                    | 価格
| user               | references | null: false, foreign_key: true |  


### Association

- belongs_to :user
- has_one    :order


#### ActiveHash::Associations
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |  
| item       | references | null: false, foreign_key: true | 


### Association

- belongs_to :user
- belongs_to :item
- has_one :order_address


## orders_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     | 　　　　　　                     |
| phone          | string     | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association

- belongs_to   :order
