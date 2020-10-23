class PurchaserCard
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
