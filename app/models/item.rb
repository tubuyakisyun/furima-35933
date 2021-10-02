class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name 
    validates :image
    validates :info 
    validates :price
  end
  validates :price,numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' , allow_blank: true}
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' , allow_blank: true}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :scheduled
  belongs_to :shipping

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :prefecture_id
    validates :status_id
    validates :scheduled_id
    validates :shipping_id
  end
end
