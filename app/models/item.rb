class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden_type
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :item_status
  belongs_to_active_hash :prefecture
end
