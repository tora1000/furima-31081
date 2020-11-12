class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address, :address_building, :phone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, :address
    validates :phone_number, format: { with: /\A[0-9]\z/}, length: { maximum: 6 }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Order.create(user_id: user.id, item_id: item.id)
    ShippingAddres.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, address_building: address_building, phone_number: phone_number, order_id: order.id)
  end


end
