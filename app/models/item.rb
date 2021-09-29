class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales
  belongs_to :scheduled
  belongs_to :shipping

  validates :name, :info, :price,:image, presence: true

  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sales_id,             numericality: { other_than: 1 , message: "can't be blank"} 
  validates :scheduled_id,         numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  
end
