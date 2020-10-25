class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :municipality
      t.string :address 
      t.string :building_name
      t.string :phone_number
      t.references :purchaser, foreign_key: true
      t.timestamps
    end
  end
end
