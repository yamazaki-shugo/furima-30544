class ShippingAddress < ApplicationRecord
  belongs_to :purchaser

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
