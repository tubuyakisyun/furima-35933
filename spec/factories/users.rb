FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) 
    password { password }
    password_confirmation { password }
    birth_date { Faker::Date.backward }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
  end
end
