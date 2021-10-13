class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :house_number, :phone_number, :prefecture_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, phone_number: phone_number], prefecture_id: prefecture_id, purchase_id: purchase.id)

    # item = Item.find(params[:item_id])
    # @purchase = item.create_purchase!(user_id: current_user.id)
    # @purchase.create_address!(address_params)
    # redirect_to root_path
  end
  
end