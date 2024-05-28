class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  validates  :title, :title_description, :price, :user, presence: true
  validates  :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipp_fee
  belongs_to :prefecture
  belongs_to :shipp_date

  validates  :category_id,
             :condition_id,
             :shipp_fee_id,
             :prefecture_id,
             :shipp_date_id,
             numericality: { other_than: 1, message: "can't be blank" }
  validates  :price,
             numericality: {
               greater_than_or_equal_to: 300,
               less_than_or_equal_to: 9_999_999,
               message: '価格 は300以上9999999以下の数字で入力してください'
             }
  validates  :price, format: { with: /\A\d+\z/, message: '価格 は300以上9999999以下の数字で入力してください' }
end
