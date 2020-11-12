class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :post_number,        null: false
      t.integer    :prefecture_id,      null: false
      t.string     :city,               null: false
      t.string     :address,            null: false
      t.string     :address_building,   null: false
      t.string     :phone_number,       null: false
      t.references :order,              foreign_key:true
      t.timestamps
    end
  end
end
