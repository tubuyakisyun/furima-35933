class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address,foreign_key: :purchase_id, dependent: :destroy

  validates :user_id, presence: true
  validates :item_id, presence: true
end
