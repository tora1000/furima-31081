class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name, :description, :category, :status, :shipping, :prefecture, :shipping_day, :image
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end
  end

  validates :category_id, :status_id, :shipping_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }
end
