FactoryBot.define do
  factory :item do
    name            {'ゴルフバック'}
    info            {Faker::Lorem.sentence}
    price           {'7000'}
    category_id     {2}
    status_id        {2}
    shipping_id     {2}
    prefecture_id   {2}
    scheduled_id    {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
