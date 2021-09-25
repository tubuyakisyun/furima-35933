class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, salesstatus_id: '---' },
    { id: 2, salesstatus_id: '新品' },
    { id: 3, salesstatus_id: '未使用に近い' },
    { id: 4, salesstatus_id: '目たった傷や汚れなし' },
    { id: 5, salesstatus_id: 'やや傷や汚れあり' },
    { id: 6, salesstatus_id: '傷や汚れあり' },
    { id: 7, salesstatus_id: '全体的に状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end