class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :order_address
end

  # fomeにまとめる
  # validates :user_id, :item_id, presence: true