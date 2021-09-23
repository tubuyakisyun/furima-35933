class sales_status < ActiveHash::Base
  self.date = [
    { id: 1, date: '---' },
    { id: 2, date: '新品' },
    { id: 3, date: '未使用に近い' },
    { id: 4, date: '目たった傷や汚れなし' },
    { id: 5, date: 'やや傷や汚れあり' },
    { id: 6, date: '傷や汚れあり' },
    { id: 7, date: '全体的に状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end