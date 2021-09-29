class Sales < ActiveHash::Base
  self.data = [
    { id: 1, sales_id: '---' },
    { id: 2, sales_id: '新品' },
    { id: 3, sales_id: '未使用に近い' },
    { id: 4, sales_id: '目たった傷や汚れなし' },
    { id: 5, sales_id: 'やや傷や汚れあり' },
    { id: 6, sales_id: '傷や汚れあり' },
    { id: 7, sales_id: '全体的に状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end