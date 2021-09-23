class shipping_fee_status < ActiveHash::Base
  self.date = [
    { id: 1, date: '--' },
    { id: 2, date: '着払い（購入者負担）' },
    { id: 3, date: '送料込み（出品者負担）' }
  ]
end