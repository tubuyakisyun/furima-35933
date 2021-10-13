class Address < ApplicationRecord
  belongs_to :purchase

  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :city
  #   validates :house_number
  #   validates :phone_number
  # end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  # validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
end

