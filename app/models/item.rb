class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :prefecture
  belongs_to :salesstatus
  belongs_to :scheduleddelivery
  belongs_to :shippingfeestatus

  validates :name, :info, :price,:image, presence: true

  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :salesstatus_id,       numericality: { other_than: 1 , message: "can't be blank"} 
  validates :scheduleddelivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shippingfeestatus_id, numericality: { other_than: 1 , message: "can't be blank"} 
  
end
