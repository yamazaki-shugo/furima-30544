class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :item_status_id
      t.integer :burden_type_id
      t.integer :shipping_area_id
      t.integer :days_to_ship_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
