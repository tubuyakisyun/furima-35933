FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08087654332' }
  end
end