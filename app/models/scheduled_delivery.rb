class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, scheduleddelivery_id: '---' },
    { id: 2, scheduleddelivery_id: '1~2日で発送' },
    { id: 4, scheduleddelivery_id: '2~3日で発送' },
    { id: 5, scheduleddelivery_id: '4~7日で発送' }

  ]
  include ActiveHash::Associations
  has_many :items
end