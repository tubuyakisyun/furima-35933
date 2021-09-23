class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :name, :info, :price, presence: true

  validates :category_id,            numericality: { other_than: 1 } 
  validates :prefecture_id,          numericality: { other_than: 1 } 
  validates :sales_status_id,        numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 

end
