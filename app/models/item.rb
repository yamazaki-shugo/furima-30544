class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden_type
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :item_status
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :item_status
    validates :burden_type
    validates :prefecture
    validates :days_to_ship
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :burden_type_id
    validates :prefectures_id
    validates :days_to_ship_id
  end
end
