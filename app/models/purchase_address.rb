class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :house_number, :phone_number, :building_name, :prefecture_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number,
              length: { maximum: 12, message: 'Please enter up to 12 digits in the phone number', allow_blank: true }
    validates :phone_number,
              length: { minimum: 9, message: 'Please enter the minimum number of digits in the phone number at 9th place',
                        allow_blank: true }
    validates :phone_number,
              format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers', allow_blank: true }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, phone_number: phone_number,
                   building_name: building_name, prefecture_id: prefecture_id, purchase_id: purchase.id)
  end
end
