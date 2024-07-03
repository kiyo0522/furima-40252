class OrdersAddress < ApplicationRecord
  belongs_to :order
end

  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # validates :price, numericality: {only_integer: true,greater_than_or_equal_to:
  # 1,less_than_or_equal_to: 1_000_000, message:'is invalid'}
  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:
  # 'is invalid. Include hyphen(-)'}
  # 0以外の整数を許可する
  # validates :prefecture, numericality: {other_than: 0,message:"can't be blank"}
