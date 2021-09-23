class scheduled_delivery < ActiveHash::Base
  self.date = [
    { id: 1, date: '---' },
    { id: 2, date: '1~2日で発送' },
    { id: 4, date: '2~3日で発送' },
    { id: 5, date: '4~7日で発送' }

  ]
  include ActiveHash::Associations
  has_many :items
end