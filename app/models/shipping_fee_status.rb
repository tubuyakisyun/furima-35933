class ShippingFeeStatus < ActiveHash::Base
  self.data = [
    { id: 1, shippingfeestatus_id: '---' },
    { id: 2, shippingfeestatus_id: '着払い（購入者負担）' },
    { id: 3, shippingfeestatus_id: '送料込み（出品者負担）' }
  ]
  include ActiveHash::Associations
  has_many :items
end