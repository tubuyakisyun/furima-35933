class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address, foreign_key: :purchase_id, dependent: :destroy
end
